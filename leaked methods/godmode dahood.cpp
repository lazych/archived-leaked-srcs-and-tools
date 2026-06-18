// THIS WILL ONLY WORK ON HOOD GAMES THAT FOLLOW THIS STRUCT/ HAVE THE ATTATCKING
void godmode()
{
 auto attacking = 
 local_player.model
 .find_first_child("BodyEffect")
 .find_first_child("Attacking");

if (attacking.value) { // bool
  attacking.set_parent(0);
}

}

void rbx::instance_t::set_parent(rbx::instance_t parent)
{
    if (!memory->is_valid_address(this->address)) return;
    memory->write<std::uint64_t>(this->address + Offsets::Instance::Parent, parent.address);
}

//usage
obj.set_parent(0); /// deletes
