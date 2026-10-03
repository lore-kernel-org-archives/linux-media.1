Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B224345736
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 21:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062209; cv=none; b=FOu4cczGVJ+Bn1pgKJFjzEVc3wJtVh5s7YT6UvW1ElMHCFEiGD02ZxriJ3sEA1avqbdNsmVviwKNrzhwR2FNjbgp+XBnN73D8dO2PhOiNGxYW+YbHHh5d/y1xBZ0mH3OF+h/eJDBiadRKf8J9piTdwOWBiiGzDI4YK2tbY4cHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062209; c=relaxed/simple;
	bh=TxpcGF5Slf/bvA99wMVUuvNDrjeVwYKyHx6lP2YsbD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iIJI8lYhGb5vuZyDnEGYlNaOlXkNjR/FzTilxLBkkzx2U3yCuqmmgaw41RcJ7GEMDUscvVTpi9GmkUT+Y9OTbJVhdX3YktJDTPQ9Oxywx+gxncg9hcfyTnTZ0l2r4HaiGQ6SVtcVRaCFq7gYzDPWmg9e2c/D8L+RCVdGcA4VLuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5tmgm/E; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5tmgm/E"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-988d0572b3bso415489241.3
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 14:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791062207; x=1791667007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tb+RdjbCttI/oJZkxUghNvoqFctdMRTZXP8tlg96uKM=;
        b=D5tmgm/Eg/xhdKCUYPSODg2gLGlfhV4RmH/DCdil858TfTf/Rt7pKE42+PK2P7iWUN
         5M/eaQpnZ1kuOSm4hsmB8cH54uHrf/AtJ4i2kAkle/jODnd6NCR5ZVuBqQgdBy4tMq/B
         q8FUUy+fMxDrIXqN7T2CTVXYh0/A4RVxlj5PaBR3TVnQRQVGM3uOdQuV3rTvtxK1C1a7
         JiIY2HYkHnfY6MuY4Q8CXeCEqUatIKNORGwFLQn4KvbsJm+tSV3u2mC5AccYg/Ld+WSE
         /Fgi4mbLtVaExHHTGOCNSouu2FaxKibHRYCkwX3Og1KPT9oOCLqXFpdmBVa6TLhjUUNz
         ln+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062207; x=1791667007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tb+RdjbCttI/oJZkxUghNvoqFctdMRTZXP8tlg96uKM=;
        b=1JlYFhhOilO7rCNtpMi8BGwGGQYxZFzBApmR6/DzyEAW4PyoITiFmwlOpX4bU3Faux
         witAWarpEw1sCnDo3cZJLOZnGGxxWGuIPCRC8tilE2Jqxlv/8ICn8wvcCQA94HNqsAH3
         g/HjYwiCubuinQUYNIcOTa160or/Q6HRSZxWDElzRx2P4pP9Yy8oC/yYZDG7qs7Nwvub
         NLfsK7JHfPpEoByr1dupNEE5wuFkxQ/25ECNkBX8sWCTzbhwdhaCjlz4CqNk7C3h4Dxa
         s5xWu4d+Zy2SEWBgPBZHKF1hFMxe+CPwvNH6Xdv3M2OIeKX7apFhilIhpHNnei36rjPk
         cQ2g==
X-Forwarded-Encrypted: i=1; AKwUvBw4xf9zUbdLqrYYq0iYwht45wQHOZLLBsh9eE6ObGbU8H7OMWYPDRWanrTrHM81yrG+rI9ArYeZ2agHFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJgpYtcxwqM4AvAaLLOmhloblg6jt4ZbZ03dwtyt7vORItfVjm2
	RBfbkVfxqkyGOTR/XtxelDlKR+R80TM8SKzxccILRoQZV8QkKBqw3EnwE9PLnQ==
X-Gm-Gg: AYBFou1NDkEIVojUXOUMPQgCwRCLJrOfhVhegL8dKbb/KzmaZPRKaVu/tOUVnWx/Bjr
	z1R8WALvhxed37FBCzVF4YxFNa1E1rEpX5KUF574ry7uUICu5PLd/9fGrNNHJA89HKZsfgzE1Q6
	SiYahpY8AkGDQxAoz6Mf3ZjvPJb8/vUoDyDtDMzLVoRnGB+tcMQe6C52QMjudBM++XLFOOTskSo
	qH9hzPnQ913MTOmFI8192iPvFvE6aM+WUnQesGrOvMxYb91jgi/1fdYcm4Qo+bd4v0tT+TanQTn
	lYqAVlg5hiLEKAdKsxADa8XuFRC64g3ovaccrciIFk4sbekC1new7rQZBA/nFGORnCGcA/J1eSw
	JBCp10MT1n2CmvAcZWEHp5cLIlcF751mDuP1wAzlDTqGKj1/SIJ+G7jb4O7kD86XxrCWWYJmfz7
	OJZmcTBnJ98jWB+Wdzf8juTELCcVGqVpt3m0fP57NJqMRulFQAtAMxUTUsrbc5DtPevntt3E8t9
	G+4qtoeZHfCKy6OA28/EQ8uME8C5bzKNrccPydko2rtdjg=
X-Received: by 2002:a67:f0c3:0:b0:7c2:7d8f:dfe with SMTP id ada2fe7eead31-7c27d8f28d7mr553410137.33.1791062207026;
        Sat, 03 Oct 2026 14:16:47 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:d915:e941:f0c4:82f6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ff5c4f06sm6017025137.3.2026.10.03.14.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:16:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 1/2] media: dt-bindings: rc: Add Ruwido Z3 RC-34 keymap
Date: Sat,  3 Oct 2026 18:16:38 -0300
Message-ID: <20261003211639.23194-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

Add rc-nec-ruwido-z3-rc34 to the list of supported keymaps.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Newly introduced. (Sean)

 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 43d84296e70d..827f4b0a8263 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -105,6 +105,7 @@ properties:
       - rc-msi-tvanywhere-plus
       - rc-mygica-utv3
       - rc-nebula
+      - rc-nec-ruwido-z3-rc34
       - rc-nec-terratec-cinergy-xs
       - rc-norwood
       - rc-npgtech
-- 
2.43.0

