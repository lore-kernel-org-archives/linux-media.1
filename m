Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA35491595
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714142; cv=none; b=mC+BjJ1WeNz7fyVap1tb7ZZRrV3/et+EDl4P7E+/mfLwxS6Twpqvz1JJiI9TwgWis09vKG9mSuMV5Bge7uVKul0zkVHRZ7UagohOUxx+VvKU79cwlQCyv4BWVimSKaLviw+WC/TKH0SgaoUvKY8j/YO0jpLVLG7CThX+d6AgCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714142; c=relaxed/simple;
	bh=7rQrFMtJ55G2Mrb8g+3bc3TGIQwSJ1ztALOvfNmBOuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pw864PbVW9Sw3F/K3z3XJOYs1TgbQs33FzH4uUryfPRx7HdHcH8PY9nZWTKOR32qoS6lsdrYQqgOUy+767RSjkVKXzAyoeQ2IXCelGelNYmsoUh+WhSgTz23j8Ips78NAfoEdzLu5MiHZ3YNa7nb2RI/FXL9CoXVeHPT11nLK8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHqYSQyy; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHqYSQyy"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so389544a91.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789714118; x=1790318918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6wREiIJDBBh1DL3Ex8v99bfdwJWaSg/ozdZvFtc4WM=;
        b=iHqYSQyyXr5OV0WxGbrCjp9ewO6g5Gaf6AaB7+VU43sx5UZhZGsAPRRiEPTeYxn8g9
         WP3d03fcRt0P4zfcNU8BP8Rau98JR1WBD0uHK0rqQK98OdGtRWlDd7SkIkhDKMeGNOCj
         kAd53ggo3KRCcP+xSNgQhDvWf4MpRK6UfsnCvgdvuhYJPcMEijkcFIvO4KYqX7Avr63F
         Ga6qVjrX0j6ftchJ07oake6DOX/Rv0Fbc0LK0ese7nEvYXNB2z1phnowMwm9FqC/6KSW
         zjq5vORfFiGWtEorKuCmR+uJ82PFy7RQDF2/Jee4EdprGOof4jhLYdUL4usPYBzkus7R
         P4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789714118; x=1790318918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6wREiIJDBBh1DL3Ex8v99bfdwJWaSg/ozdZvFtc4WM=;
        b=A41nVbPtjjdHOwmrUJ5cmtw8S5UUa5sKvWW5C/o4zOXLFR3rtsXi40zwm8sSNDJk63
         gLjz/RJ/0yNK/wMcwB7AWskvlWTsRUVPYurk3fUdUVJ1c2qe+mw8uUlRnZIcrrD5MRom
         CcDyiKTnsyh2Z0VP9KhLqCtjaVH1oxMgXTOloX8NW2ThoYAEqa2iTQMZP4P7eVg/xuNe
         chfSGdNLwulO5FxW6Mf2c5BPmoTgMdzEiqtGWO5Tutd8g2pura7gUvbhP2rH3DyhvSk9
         jjW+9+3qGE2xs2BqqT5ShdhlGagc3j3pDf6TBBGeDmu1RKONshcqhbo3C8c/3J4h7fXK
         Uz2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4OGEFNJLF5nppDhKn1GU7vHq33tONtVzsiAMcmO9S7n1Fv/QC+QdDXK8OZTE422vg/5mdiRQybIv5oA==@vger.kernel.org
X-Gm-Message-State: AFuF++mBE6aLFMo6RQbCrO84jyD/2a/efvKoLeZtnm3LMzLkojLyPWH7
	5OejUSUab2xQ+D9EG0hoP/RpuqU2h4tAOCA8AkD6v962zucfj2yK9b0=
X-Gm-Gg: AYBFou2KdcQwVNthwiyqBLf72iXDGVElFp9Elwyv+JKc1J3kJ8JeMHEPubY4z1MOcRx
	wMAUnLXNkzUrUSsdiaCN5X/P4tre1JjxuwQYLSh3cBaQrP8LySzkjloXa2QqGQstLpkWWhkrebG
	DYSQeTAyH8ON0X4TFQ+c9dxCBmaeBSvHDGNsck4D4RcaT9AocbnWFK9eif1JL1EemvFh245ATDI
	6zKbXmXgPQEvHbxIu0HWMnsj2DT70HZGxr0+DpZGa1QVDm37IPZlMmKZzy1KPMETc8L0xX0w/nr
	+o12qUajMFqeLrbUeBsB3jGu/4Rf/Nn92k1i9rHnRQVTe8w1QZmJwRgXGa99XJbCR439aStrt/O
	kYKqTWeYXZwEB1TGTWJJvTXtoS49mvPlekF191n6foCy712QbLjEcBabzjp/FvXI7DdOvJXfQqg
	/ISmk72mlj4tLLbeJSkrVO4MXnPpOh9RKtzoOsyyc6byNyClvxf8Apf9y1JyjOMai1wvZRQg4bF
	MjbsaenJKs6B6jKO8MJnkE=
X-Received: by 2002:a17:90b:4a03:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e54d38c48mr5637761a91.8.1789714118110;
        Thu, 17 Sep 2026 23:48:38 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50d332sm1578331a91.9.2026.09.17.23.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:48:37 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: tomi.valkeinen@ideasonboard.com
Cc: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	naush@raspberrypi.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: raspberrypi: Fix error handling for media_entity_remote_source_pad_unique()
Date: Fri, 18 Sep 2026 13:48:32 +0700
Message-ID: <20260918064832.891339-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media_entity_remote_source_pad_unique() function returns an error
pointer on failure, not NULL. Fix the check to use IS_ERR() and return
PTR_ERR() to correctly handle allocation failures.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..91e9fa0341e0 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
 		cfe_err(cfe, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.53.0

