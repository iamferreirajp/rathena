// Copyright (c) Athena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

struct achievement *mapif_achievements_fromsql(uint32 char_id, int *count);
bool mapif_achievement_delete(uint32 char_id, int achievement_id);
bool mapif_achievement_add(uint32 char_id, struct achievement ad);
bool mapif_achievement_update(uint32 char_id, struct achievement ad);
int mapif_parse_achievement_save(int fd);
int mapif_parse_achievement_load(int fd);

#ifndef _INT_ACHIEVEMENT_SQL_H_
#define _INT_ACHIEVEMENT_SQL_H_

int inter_achievement_parse_frommap(int fd);

#endif /* _INT_ACHIEVEMENT_SQL_H_ */
