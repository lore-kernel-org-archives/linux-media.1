Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9145153D0BC
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092419; cv=none; b=Oo6F7I9sSBF+wjL6hRUa61tfo4f6CSM++MsgAG3IPB3zBtBjxVMdqX4vGWtEwJ9E/Z6tGx9lYcOCKlUQqirCXQ1tZMk47Q6ooGuREIiEE+du6nnhXH2TsbFf2pVF3vrEBsQaw66w53sWdH0lnXbw/k3zfWoWKrq3vo9GVcMjmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092419; c=relaxed/simple;
	bh=KfP/vjeGWsuZ4w73uZHQKGJi0F/32o26SPzn575BRdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxwWP3IWfsUZwv0i6kugMAMCUwxxIF8AVTIIGTl3eMGSwJRm2DSHjGx9SymbG6HdRxsZhrZogAHHhooUk3ivlIH5SrZaCgSblB3FD+eqlw0Kwz/qvaHvvvV06aqO07l9xpk4tRyF1zGXz9Zuos0Ozz6vxlJH+VmXK+VLgwWWiPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghleTTrA; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghleTTrA"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-530e75d1ba1so55485541cf.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792092413; x=1792697213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BOiR3HjstR3v+8dWKVs/nFPkMjZqmy5flCQLz7ZGEc=;
        b=ghleTTrA8sN3BkxMrEg+fVh8FkC3NAswPWRc8KNteLq+XWUBrCuH3gy2skylDXgdkk
         2Kw6RcWY8I6DoT7Bk5FPSU1UgXyPJ57/1J3hnFDLfHFYdCEzz4SrPkQNJPc2RzmS5CLd
         4zAzML1nBpVVqAnDE9xZZiQ4TJHyFLALOgMn5HKKTZ15PxJTsNPLsf4L5zRPe+OXhh/J
         YwrsvGQcfpiwb90OSsB3P2MjvSRRxu7VyFbpnYrhIZoJxlCVZqKejy1JbwvcNUES9K/F
         lSi3aGkeLfw59/s35p16i+5mLhuPk782zXkclllo+iDEPaBtZ89srxGR575AKiCr4OK7
         t24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092413; x=1792697213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BOiR3HjstR3v+8dWKVs/nFPkMjZqmy5flCQLz7ZGEc=;
        b=whgFA0PbUIhm9bsEYRCQaeFdFcfiC7VdTwNPQ8ImiEgym+ASdaTYKcfjbw92/L/8XI
         n60LKjlKPey6Vpyf7d0uDgoTSvNNmNSTG7Ws8ZoYl5fAbAPKH2vic0wInN0VVN+YJ+Vi
         fh/szQlX3VFMsg9KuIUHH8BiaXDM6RAkEjCzi84+YKsEy/4MeIfdE8xEM/hIIdmQQH0G
         16jgv9yMVwmPX4V4pXggBQPpqh3OzGpIBdVHm/YJIYz4WoOjbWtO2eUZnCKS0W3OchSm
         cYkDMje+1472h8SBr3G4roMsEgOASjZIaARlByHbM2OhyGNQWBiXd3kOgSb5DuYtKqLp
         BLtA==
X-Forwarded-Encrypted: i=1; AKwUvByvf3U1dRCUu0GWmtjx5V1gX4Y5aXGkSAGBkeju9xG1ciXe30OLye+ccz7EHm2C47jNYHpQtBxXm3703A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLsNDuQv5CuvpIXCYtTI2X0o7FzabYHnLImwkOgNoIoUzi8gUBZ
	9c0+tKneTqCNdyE5lIzYRYyKiL6vsiEuE3iwKXr8uZUFuKNp4RQnIbR9
X-Gm-Gg: AYBFou0MG1eIaqqrOGzPeAxWoIsyrvuv05OC8eo6/ts62CvnPGEQ0DBDqv7tsH1MmIA
	q3yMLNrVgN5+4f6X34cU/g8JleijuGoek3ee/waBTGRUU9cKBU5V+vZ6kfUNj/VB1hsHI+9cj0a
	v0vBwcCyCPUKBzT85vv4JMfgvoGUXCiJB+kGeYZh2lWklc/zSBk6AvqGUHpvByDSYTXIRaATAJe
	/5cDHWxp8qTUhO1PeJ9MKQIvmTIJhUam+wniGil25YQXi30v9ZCqNXFwH/R/S7MHdthrK5yNEOx
	i2/JUgsOhxHA5eYQm2Vp7IXjvPu4uuIjYO8Wg5h/ZfckkDHQ1xFbU9NlV4R+sG0k1T7D06LaYPP
	JbmAeUL7f4NhDq6G2oEMIdBpk9DkfZMNFCMp6On+On9sSNhQC9HrgDlZICklPNVw2rDT3y96GYi
	cg31wXhhgVBz1XGD8uiv3DmiTm0aYO+2PPgBnJYCIvfT8nEGxkqzYfT06xPx4jcoeUOWv9pqB02
	vhZp6Jy9R8AzMAxRkCi4qaX5tg=
X-Received: by 2002:ac8:5c8b:0:b0:535:cd9e:c12f with SMTP id d75a77b69052e-535cda02393mr232419501cf.32.1792092413486;
        Thu, 15 Oct 2026 12:26:53 -0700 (PDT)
Received: from localhost ([144.121.52.163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb8c4a1sm3270566d6.45.2026.10.15.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:26:52 -0700 (PDT)
From: Ray Strode <halfline@gmail.com>
To: rshouriesh@gmail.com
Cc: bod@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	j@metarealtyinc.ca,
	krzk+dt@kernel.org,
	kulikeduard89@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v7 3/3] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Thu, 15 Oct 2026 15:26:24 -0400
Message-ID: <20261015192632.283185-1-halfline@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
Regarding the crop-bounds question: the 19.2 MHz mode reports a 1294x734=0D
crop at (0,0), which extends outside the advertised 1280x720 bounds at=0D
(8,8).=0D
=0D
Reporting the native array as CROP_BOUNDS accommodates that readout window=
=0D
while keeping CROP_DEFAULT as the active area:=0D
=0D
diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c=0D
--- a/drivers/media/i2c/hm1092.c=0D
+++ b/drivers/media/i2c/hm1092.c=0D
@@ -836,12 +836,12 @@=0D
 		sel->r =3D to_hm1092(sd)->mode->crop;=0D
 		return 0;=0D
 	case V4L2_SEL_TGT_CROP_DEFAULT:=0D
-	case V4L2_SEL_TGT_CROP_BOUNDS:=0D
 		sel->r.left =3D HM1092_ACTIVE_LEFT;=0D
 		sel->r.top =3D HM1092_ACTIVE_TOP;=0D
 		sel->r.width =3D HM1092_ACTIVE_WIDTH;=0D
 		sel->r.height =3D HM1092_ACTIVE_HEIGHT;=0D
 		return 0;=0D
+	case V4L2_SEL_TGT_CROP_BOUNDS:=0D
 	case V4L2_SEL_TGT_NATIVE_SIZE:=0D
 		sel->r.left =3D 0;=0D
 		sel->r.top =3D 0;=0D
=0D
This changes only the reported bounds; the mode's crop and register=0D
configuration stay the same.=0D
