import '../../domain/entities/board.dart';
import '../../domain/repositories/board_repository.dart';

class GetBoardBySessionIdUseCase {
  const GetBoardBySessionIdUseCase({
    required BoardRepository boardRepository,
  }) : _boardRepository = boardRepository;

  final BoardRepository _boardRepository;

  Future<Board?> call(String sessionId) {
    return _boardRepository.getBoardBySessionId(sessionId);
  }
}