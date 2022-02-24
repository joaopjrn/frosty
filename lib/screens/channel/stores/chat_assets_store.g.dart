// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_assets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatAssetsStore on _ChatAssetsStoreBase, Store {
  Computed<List<Emote>>? _$bttvEmotesComputed;

  @override
  List<Emote> get bttvEmotes =>
      (_$bttvEmotesComputed ??= Computed<List<Emote>>(() => super.bttvEmotes,
              name: '_ChatAssetsStoreBase.bttvEmotes'))
          .value;
  Computed<List<Emote>>? _$ffzEmotesComputed;

  @override
  List<Emote> get ffzEmotes =>
      (_$ffzEmotesComputed ??= Computed<List<Emote>>(() => super.ffzEmotes,
              name: '_ChatAssetsStoreBase.ffzEmotes'))
          .value;
  Computed<List<Emote>>? _$sevenTVEmotesComputed;

  @override
  List<Emote> get sevenTVEmotes => (_$sevenTVEmotesComputed ??=
          Computed<List<Emote>>(() => super.sevenTVEmotes,
              name: '_ChatAssetsStoreBase.sevenTVEmotes'))
      .value;

  final _$_recentEmotesAtom = Atom(name: '_ChatAssetsStoreBase._recentEmotes');

  ObservableList<Emote> get recentEmotes {
    _$_recentEmotesAtom.reportRead();
    return super._recentEmotes;
  }

  @override
  ObservableList<Emote> get _recentEmotes => recentEmotes;

  @override
  set _recentEmotes(ObservableList<Emote> value) {
    _$_recentEmotesAtom.reportWrite(value, super._recentEmotes, () {
      super._recentEmotes = value;
    });
  }

  final _$_emoteToObjectAtom =
      Atom(name: '_ChatAssetsStoreBase._emoteToObject');

  Map<String, Emote> get emoteToObject {
    _$_emoteToObjectAtom.reportRead();
    return super._emoteToObject;
  }

  @override
  Map<String, Emote> get _emoteToObject => emoteToObject;

  @override
  set _emoteToObject(Map<String, Emote> value) {
    _$_emoteToObjectAtom.reportWrite(value, super._emoteToObject, () {
      super._emoteToObject = value;
    });
  }

  final _$_userEmoteToObjectAtom =
      Atom(name: '_ChatAssetsStoreBase._userEmoteToObject');

  Map<String, Emote> get userEmoteToObject {
    _$_userEmoteToObjectAtom.reportRead();
    return super._userEmoteToObject;
  }

  @override
  Map<String, Emote> get _userEmoteToObject => userEmoteToObject;

  @override
  set _userEmoteToObject(Map<String, Emote> value) {
    _$_userEmoteToObjectAtom.reportWrite(value, super._userEmoteToObject, () {
      super._userEmoteToObject = value;
    });
  }

  final _$_userToFFZBadgesAtom =
      Atom(name: '_ChatAssetsStoreBase._userToFFZBadges');

  Map<String, List<Badge>> get userToFFZBadges {
    _$_userToFFZBadgesAtom.reportRead();
    return super._userToFFZBadges;
  }

  @override
  Map<String, List<Badge>> get _userToFFZBadges => userToFFZBadges;

  @override
  set _userToFFZBadges(Map<String, List<Badge>> value) {
    _$_userToFFZBadgesAtom.reportWrite(value, super._userToFFZBadges, () {
      super._userToFFZBadges = value;
    });
  }

  final _$_userTo7TVBadgesAtom =
      Atom(name: '_ChatAssetsStoreBase._userTo7TVBadges');

  Map<String, List<Badge>> get userTo7TVBadges {
    _$_userTo7TVBadgesAtom.reportRead();
    return super._userTo7TVBadges;
  }

  @override
  Map<String, List<Badge>> get _userTo7TVBadges => userTo7TVBadges;

  @override
  set _userTo7TVBadges(Map<String, List<Badge>> value) {
    _$_userTo7TVBadgesAtom.reportWrite(value, super._userTo7TVBadges, () {
      super._userTo7TVBadges = value;
    });
  }

  final _$_userToBTTVBadgesAtom =
      Atom(name: '_ChatAssetsStoreBase._userToBTTVBadges');

  Map<String, Badge> get userToBTTVBadges {
    _$_userToBTTVBadgesAtom.reportRead();
    return super._userToBTTVBadges;
  }

  @override
  Map<String, Badge> get _userToBTTVBadges => userToBTTVBadges;

  @override
  set _userToBTTVBadges(Map<String, Badge> value) {
    _$_userToBTTVBadgesAtom.reportWrite(value, super._userToBTTVBadges, () {
      super._userToBTTVBadges = value;
    });
  }

  final _$emoteMenuIndexAtom =
      Atom(name: '_ChatAssetsStoreBase.emoteMenuIndex');

  @override
  int get emoteMenuIndex {
    _$emoteMenuIndexAtom.reportRead();
    return super.emoteMenuIndex;
  }

  @override
  set emoteMenuIndex(int value) {
    _$emoteMenuIndexAtom.reportWrite(value, super.emoteMenuIndex, () {
      super.emoteMenuIndex = value;
    });
  }

  final _$showEmoteMenuAtom = Atom(name: '_ChatAssetsStoreBase.showEmoteMenu');

  @override
  bool get showEmoteMenu {
    _$showEmoteMenuAtom.reportRead();
    return super.showEmoteMenu;
  }

  @override
  set showEmoteMenu(bool value) {
    _$showEmoteMenuAtom.reportWrite(value, super.showEmoteMenu, () {
      super.showEmoteMenu = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ChatAssetsStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_ChatAssetsStoreBaseActionController =
      ActionController(name: '_ChatAssetsStoreBase');

  @override
  Future<void> assetsFuture(
      {required String channelName,
      required String channelId,
      required Map<String, String> headers,
      required Function onEmoteError,
      required Function onBadgeError}) {
    final _$actionInfo = _$_ChatAssetsStoreBaseActionController.startAction(
        name: '_ChatAssetsStoreBase.assetsFuture');
    try {
      return super.assetsFuture(
          channelName: channelName,
          channelId: channelId,
          headers: headers,
          onEmoteError: onEmoteError,
          onBadgeError: onBadgeError);
    } finally {
      _$_ChatAssetsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> emotesFuture(
      {required String channelId,
      required String channelName,
      required Map<String, String> headers,
      required Function onError}) {
    final _$actionInfo = _$_ChatAssetsStoreBaseActionController.startAction(
        name: '_ChatAssetsStoreBase.emotesFuture');
    try {
      return super.emotesFuture(
          channelId: channelId,
          channelName: channelName,
          headers: headers,
          onError: onError);
    } finally {
      _$_ChatAssetsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> badgesFuture(
      {required String channelId,
      required Map<String, String> headers,
      required Function onError}) {
    final _$actionInfo = _$_ChatAssetsStoreBaseActionController.startAction(
        name: '_ChatAssetsStoreBase.badgesFuture');
    try {
      return super.badgesFuture(
          channelId: channelId, headers: headers, onError: onError);
    } finally {
      _$_ChatAssetsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> userEmotesFuture(
      {required List<String> emoteSets,
      required Map<String, String> headers,
      required Function onError}) {
    final _$actionInfo = _$_ChatAssetsStoreBaseActionController.startAction(
        name: '_ChatAssetsStoreBase.userEmotesFuture');
    try {
      return super.userEmotesFuture(
          emoteSets: emoteSets, headers: headers, onError: onError);
    } finally {
      _$_ChatAssetsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emoteMenuIndex: ${emoteMenuIndex},
showEmoteMenu: ${showEmoteMenu},
bttvEmotes: ${bttvEmotes},
ffzEmotes: ${ffzEmotes},
sevenTVEmotes: ${sevenTVEmotes}
    ''';
  }
}