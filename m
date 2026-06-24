Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FD377ED2;
	Wed, 24 Jun 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301190; cv=none; b=gI2IavHWWjVC1OEMERnYcMxTD/CmcHoksA8skwsYDsRMhidzGfASJtl0UFxakE80e1IkolAEl0oqHe2h2cnAaRfUo/xxV8i6mwGyxmD7I1aD1h2Hh8IrnAROZcCysgI/OUpK9Kj9SiYDRpkPSnE+EBIbAJIHt10TrgEtDWC3MHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301190; c=relaxed/simple;
	bh=MYk4fHbvLorHBrpr4x5XpPxgbJ5pAUDuxK8HB97OLyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIXoSWAU8/H/kxtkHRzutz5w/ujv4x1ykaEBtDfHQhD8YlC14zdBoAieOBOzSkUHfljRsyHyB8V7dDLE4CeM1EqG3HiJmRDMQ/E0zIydr4QD6uYwWptg3Mipo3srDrP+7zt2qGqYiYpXHgeq0EthnTq2P8+e1bRzJTmklDa5xX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=BeHMjuH1; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Z8JhZ71e; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="BeHMjuH1";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Z8JhZ71e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301181; bh=MYk4fHbvLorHBrpr4x5XpPxgbJ5pAUDuxK8HB97OLyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BeHMjuH1oJ2MwzpLK60C6xG4nnyHpgWKQoggW51Uf/DNRhosmMRxvnU2+DrDTw8QM
	 6hFrL9ELgCc2r7widxPb5lJ9bSpjOoYM7QBjB56uoomny+gCziI2lhOoh2mKypHggI
	 1B+YckcKwCQKg2pXNRTDMIe8FrJKiYli7hYtefXz/gEUxocKcf+vgMcG5Yz2NuqvEx
	 5YRrwe/3Q2Tl2BAglJW9eOr1T0W+O+IT7xiUprOT6h97pjKKOOBGPPrUwbRI7yQHzv
	 JwRBiG+hoFxepWnWh7sFcl4SaDn64fayj3Si1iVFnO8TQVMROa498dBHKY43jJX30F
	 qLg8pCr/xVgrQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 9EC7042536; Wed, 24 Jun 2026 12:39:41 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301180; bh=MYk4fHbvLorHBrpr4x5XpPxgbJ5pAUDuxK8HB97OLyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8JhZ71ezghf90sk5lecbWgu/86PT/yQZjrVxQZOUDixBenZ9AC8dUkJZU1wu4iCq
	 tcn63SAv5rd0m60XN0N8dSzInQ90KLs1hBowNhXLlBqFtbfgHDsYtzM6ldyxBvd+u8
	 6/5rbvGZE7mU9yWJWbFH3Ichej50ah18Oeb/y4MsUwMGOx4F/BLvOlQXzvOOjIimwy
	 2AJQhm/ZD4vWjmGYsAM0L1aPmHujyewO5taByqZOU/LH/RJTYf090dX4nfVpQjJBYk
	 6Uc+He5tT8vzZV7vEl6di9h7qk9m99BUwjWUsz4EoAAtOlURpxd9fRNvQNlqOSQ9o4
	 zLcuR1eKSfc6w==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 7378F42528;
	Wed, 24 Jun 2026 12:39:40 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
Date: Wed, 24 Jun 2026 12:39:19 +0100
Message-ID: <40ef63edc7535e346fd992bb15db04acf77da1f8.1782300922.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782300922.git.sean@mess.org>
References: <cover.1782300922.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit af86ce79f020 ("[media] remove the old RC_MAP_HAUPPAUGE_NEW
RC map"), the RC_MAP_HAUPPAUGE_NEW define is no longer used.

Fixes: af86ce79f020 ("[media] remove the old RC_MAP_HAUPPAUGE_NEW RC map")
Signed-off-by: Sean Young <sean@mess.org>
---
 include/media/rc-map.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 950d702aee3b..d95ed3e96de2 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -262,7 +262,6 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_GENIUS_TVGO_A11MCE        "rc-genius-tvgo-a11mce"
 #define RC_MAP_GOTVIEW7135               "rc-gotview7135"
 #define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
-#define RC_MAP_HAUPPAUGE_NEW             "rc-hauppauge"
 #define RC_MAP_HISI_POPLAR               "rc-hisi-poplar"
 #define RC_MAP_HISI_TV_DEMO              "rc-hisi-tv-demo"
 #define RC_MAP_IMON_MCE                  "rc-imon-mce"
-- 
2.54.0

