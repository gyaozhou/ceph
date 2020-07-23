


###
AsyncMessenger -> SimplePolicyMessenger -> Messenger

1. Processor, handle incoming new connection
1. AsyncConnection -> Connection
###
NetworkStack, Manage threads to handle network stack.
1. PosixNetworkStack -> NetworkStack
1. DPDKStack -> NetworkStack
1. RDMAStack -> NetworkStack

###
Dispatcher

1. OSD -> Dispatcher
1. Objecter -> Dispatcher

###
PrimaryLogPG -> PG
             -> PGBackend::Listenser

###

ReplicatedBackend -> PGBackend
ECBackend -> PGBackend


###
ObjectStore

1. FileStore -> JournalingObjectStore -> ObjectStore
1. BlueStore -> ObjectStore
             -> BlueFSDeviceExpander



###
  // zhou: PrimaryLogPG::queue_transactions() ->
  //         PGBackend::Listener->queue_transactions() ->
  //            BlueStore::queue_transactions()/FileStore::queue_transactions



   // zhou: refer to PrimaryLogPG Listener related API.
   //       PGBackend(and its derived class) doesn't own ObjectStore(and its derived class).
   //       PrimaryLogPG's Listener API is a interface for PGBackend invoke ObjectStore API.
   PGBackend::Listener *parent;
