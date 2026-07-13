Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880DEAD24
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978293; cv=none; b=nOP/mbKb78IbEatDXFKwCpem3wd1uEkHiFGls77UCSya8r+wPSavWj62fz3WBZXXT8YqzTAF+65vU0NsljNX9lV/za1Z7DUAxkq8KAsdJ+6OCxNSbQ/F3uKssuIzN9nyAU5ue1JNobDb0rsEYl6gtHf2LnPePTE3+HImDhGXdDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978293; c=relaxed/simple;
	bh=G09c9zdRjTJFkp9HaCvR+kdJ1DKoflUVTRryNAb+u6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K56pXLnAQL1UABn+yB+c4KHafngEBgPYwnJa9dhktP7x06TSRSg4gscapyj2WE1VubrqwkDCn67UucGrb60G5a1Fiaa7DTuwOccedjNjZ34A3odyp7JIE39H15rQh88znUei4pP9PgQyZxYN0EKumo+p2v6zx3FdBfhlDLoliX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=H/KymOPK; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=mmfaKOY+; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="H/KymOPK";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="mmfaKOY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978281; bh=G09c9zdRjTJFkp9HaCvR+kdJ1DKoflUVTRryNAb+u6w=;
	h=From:To:Cc:Subject:Date:From;
	b=H/KymOPKAx6dkiEoA5Klm22x0yMR8i+zK2PBpgH2ECkSuZsS/aUXCbmgFn7OilfMX
	 rD8ghkAHvqGS5dgGXKUvDWSLZZp71pTF0Yf/MZTAtu5EkXxCS2R7FlRM3o5X40pa3F
	 fgr3kD75HBKW+aqTheKHlMiRNeWV1Hyja9mufrSzQ9wTTPy7DPuVZP7I5W+gfpSLSp
	 4rWp4WGCIIJtdnFybfDt/0/VaIyDNdA8VT3mmO/96SritcVK6oHyaF89yNVUnC+w9f
	 YSO6lzDStshaAOm54BonmtDkjuMyD2pkLCIED9GQZ8OqTNCArDaMbMpG2GT51LNILg
	 aCnZbKEj9JO+w==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C97AF40A3A; Mon, 13 Jul 2026 22:31:21 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978280; bh=G09c9zdRjTJFkp9HaCvR+kdJ1DKoflUVTRryNAb+u6w=;
	h=From:To:Cc:Subject:Date:From;
	b=mmfaKOY+rjxEyJvSOKy+TbVID3zrqFm8jkZByxxcT2SORXP2caedHCs6Ud2I46v7f
	 ZHHNIriZcGLkAd2dglda2oPfIha3An8k+brijxNN6LGsq+K97AaWxy6PVMR4aI5GIL
	 qtt7FSbj5iDGMS4iuuEQpQBOH1Okbnhh59KQrAo81hl8iHsCxeyrnLL5fHgK14ugkw
	 SmWWWLOBuHRdpcJneZlnp00/2lO7hBrxLu3wImgCXSzUeLh8hOaog+rQe5riZf+fDK
	 VSrMBO64UgVv/ZsGMRvavCKJOyN0OmWz0eterxojpEQnuSfZ3uCn2lAD206j/6QCP6
	 BgSx/2H9i/FhA==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id D276740155;
	Mon, 13 Jul 2026 22:31:20 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Sean Young <sean@mess.org>
Subject: [PATCH v2 00/11] Fix leaks in rc core
Date: Mon, 13 Jul 2026 22:30:54 +0100
Message-ID: <cover.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
 - sashiko had many good review comments
 - Added fix rc: Use after free in ir_raw_event_handle() 
 - Added fix meson-ir-tx: Ensure probe error is propagated
 - Added fix redrat3: Ensure all urbs are suspended
 - Added fix media: redrat3: Error path leaves device in transmitting state
 - streamzap fix was incorrect 
 - Other minor fixes

Sean Young (11):
  media: streamzap: Add missing rc_unregister_device()
  media: redrat3: Ensure rc device is freed if enable_detector() fails
  media: redrat3: Ensure we don't read beyond the end of the packet
  media: redrat3: Ensure all urbs are suspended
  media: redrat3: Error path leaves device in transmitting state
  media: sunxi-cir: Ensure no more interrupts can occur before free
  media: meson-ir-tx: Ensure clock is disabled on unbind
  media: meson-ir-tx: Ensure rc_free_device() is called on unbind
  media: meson-ir-tx: Ensure probe error is propagated
  media: ir-hix5hd2: Ensure rdev is setup before interrupts are enabled
  media: rc: Use after free in ir_raw_event_handle()

 drivers/media/rc/ir-hix5hd2.c  |  5 +++--
 drivers/media/rc/meson-ir-tx.c | 14 ++++++--------
 drivers/media/rc/rc-ir-raw.c   |  8 ++++++--
 drivers/media/rc/redrat3.c     | 28 ++++++++++++++++++++++++----
 drivers/media/rc/streamzap.c   |  1 +
 drivers/media/rc/sunxi-cir.c   |  2 +-
 6 files changed, 41 insertions(+), 17 deletions(-)

-- 
2.55.0

