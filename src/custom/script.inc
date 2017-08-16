// Copyright (c) Athena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

/**
 * Custom Script Commands
 * Place the body of custom script commands in this file.
 * Format:
 *	BUILDIN_FUNC(command_name)
 *	{
 *		<code>;
 *	}
 **/

//BUILDIN_FUNC(example)
//{
//	ShowInfo("buildin_example: It works!\n");
//	script_pushint(st,1);
//	return 0;
//}

/*==========================================
 * send mail via scriptcommand [clydelion]
 * usage:
 * sendmail <Recipient's Char ID>,"<Sender's Name>","<Title>","<Body>",<zeny>,<item_id>,<amount>{,<refine>,<attribute>,<card1>,<card2>,<card3>,<card4>};
 *------------------------------------------*/
BUILDIN_FUNC(sendmail) {
	struct mail_message msg;
	struct item item_tmp;
	struct item_data *item_data;
	int item,amount,a,zeny;
	int ref = 0,attr = 0, c1 = 0, c2 = 0, c3 = 0, c4 = 0;
	const char* b;
	const char* c;
	const char* d;
	TBL_PC *sd;
	struct script_data *data;

	memset(&msg,0,sizeof(msg));
	
	a=script_getnum(st,2); //Recipient's Char ID
	b=script_getstr(st,3); //Sender's Name
	c=script_getstr(st,4); //Title
	d=script_getstr(st,5); //Body
	zeny=script_getnum(st,6); //zeny amount
	
	data=script_getdata(st,7); //Item name/ID
	get_val(st,data);
	if( data_isstring(data) ){
		const char *name=conv_str(st,data);
		*item_data = itemdb_searchname(name);
		if( item_data )
			item=item_data->nameid;
		else
			item=UNKNOWN_ITEM_ID;
	}else
		item=conv_num(st,data);
	
	//Amount
	amount=script_getnum(st,8);
	
	//Refine
	if( script_hasdata(st,9) )
		ref=script_getnum(st,9);
	
	// Attribute
	if( script_hasdata(st,10) )
		attr=script_getnum(st,10);
	
	// Cards
	if( script_hasdata(st,11) ) 
		c1=(short)script_getnum(st,11);
	if( script_hasdata(st,12) )
		c2=(short)script_getnum(st,12);
	if( script_hasdata(st,13) )
		c3=(short)script_getnum(st,13);
	if( script_hasdata(st,14) )
		c4=(short)script_getnum(st,14);

	if(!(sd = map_charid2sd(a)))
		return 0;

	msg.id = 0;
	msg.send_id = 0;
	msg.dest_id = a;
	if(strlen(b) > 0) //Sender's Name
		safestrncpy(msg.send_name, b, NAME_LENGTH);
	else
		safestrncpy(msg.send_name, wisp_server_name, NAME_LENGTH);

	safestrncpy(msg.dest_name, sd->status.name, NAME_LENGTH);
	
	if(strlen(c) > 0) //Title
		safestrncpy(msg.title, c, MAIL_TITLE_LENGTH);
	else
	{
		static char char2[256];
		snprintf(char2, sizeof(char2), "noreply@%s", wisp_server_name);
		safestrncpy(msg.title, char2, MAIL_TITLE_LENGTH);
	}
	
	if((item_data=itemdb_exists(item)) && amount > 0)
	{
		memset(&item_tmp,0,sizeof(item_tmp));
		if (item_data == NULL)
			return -1;
		if(item_data->type==IT_WEAPON || item_data->type==IT_ARMOR){
			if(ref > MAX_REFINE) ref = MAX_REFINE;
		}
		else if(item_data->type==IT_PETEGG)
			ref = 0;
		else
			ref = attr = 0;

		if (!itemdb_isstackable(item))
			amount = 1;
		item_tmp.nameid   = item;
		item_tmp.identify = 1;
		item_tmp.amount = amount;
		item_tmp.refine=ref;
		item_tmp.attribute=attr;
		item_tmp.card[0]=(short)c1;
		item_tmp.card[1]=(short)c2;
		item_tmp.card[2]=(short)c3;
		item_tmp.card[3]=(short)c4;
		memcpy(&msg.item, &item_tmp, sizeof(struct item));
	}
	msg.zeny = zeny;
	
	safestrncpy(msg.body, d, MAIL_BODY_LENGTH);
	
	msg.timestamp = time(NULL);
	
	intif_Mail_send(sd->status.account_id, &msg);
	
	return 0;
}


