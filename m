Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196429;
	b=F3JOMWeEyilH+mV0pqKifwCGObv+iTUtUYj1Po+z20UGjdRE+9Pr1fgK4MgQmJbjxvQi
	 poIyGSz/2nwHJLUs1dMmizMbv6Al/Hd74tCkDZHxXm3EuVQMeeBOnB2K+POOO3RqSwnmf
	 naw2/qEAFFfvGJ4mePHLlo9JAJXbQTvJE18/Bx/3Rntw5fCZ6TSnt1lMhMKerWPZVvaSp
	 fw/8b5OEis2rOm4PzWjXhaVYZlKpktfhRiFKzlpKs2G2U1wum4tVRXE9fiiJZX6W6l1TX
	 ELCDsvFk+OghZ7+8vRmd+PyyzISYloe8Pv3e/d8r8Im2IVbrlesN+U/w3SRVPdinECw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uq9H+1lFYYvgo3IDYWApxfWNUbzn0gKG5Ril08BpDPA=;
	b=2XtC2tiXTqWSWWGO5qnpP0OfA5uYNxM5cFWobnNp0qHg2uuAlr5FXZwZumgpatiqh40w
	 tQWT/uKSnDukyPsyFZfgJ3DVs6uNyCl1zr+3CDwA6enalaNv/hyjg8UC0Gd93wzzk3qwN
	 a41PMrcNDfkbhaGqFNJ33aS9BalMQSdw8q+5niotvVVBLdDwHq55iEJRo3gTFY5bZmMp3
	 OBwuY80uQgsBvRbpNRBWrYi+jIHUPrABjGkbBHwYpTMximOhs2ogTyEt5crEKIW4flUYH
	 ArN4NBDbYC36Uwoow8JLLojxYybLoAxTCrciIkeEG4b1+jhc381PlV1Zhc1tb4EvuPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj+kBFl2;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771260A2605
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8771260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj+kBFl2
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5366ae57896so12249801cf.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196426; x=1795801226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq9H+1lFYYvgo3IDYWApxfWNUbzn0gKG5Ril08BpDPA=;
        b=oj+kBFl2mFyou4ugg5xyx756ynmWosuj6EnM4EqEifbQVF1upP8tAc4NC+4u3DD+bM
         B5e4mAnLzH06i/ryZMER2uThnbcQvc21pxmQwNar/yrWX5dizUq6B/8NTVgufjjJAB6f
         hP30V39JUmBavLgizJ6nXAkIrWHnwhDEUKDbQgkjvdk14ePChjaDJtfk75hp4BHwYMIt
         nV5GI+F1Jj97v/2pANN8X/4yregVxxUzEqcyfJ4kDgK+orPkncMGSpEjxd81u00Y+fIg
         QZtP0J2E/MWURxT5w5qWOPPgUK9BUS9qilHsKnrrJKk3FTNKPZ6NcdvVJkWL/+Qn4bja
         wCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196426; x=1795801226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq9H+1lFYYvgo3IDYWApxfWNUbzn0gKG5Ril08BpDPA=;
        b=Ml6uKTZtywL7lKEEVMp1gqzbt+UIJTo4QRjbom3nMlor+zRMAQwiQe4Mk3J4SZXUXU
         CtFDl79Jz/GqM63t1Kz6Rp0aHaZCIXPIi/qR6eGkMUQRTwI8qLzhm46NPHdfevFvKZ4S
         /S6pzCWvfLz4FVc8x4NiMxsY4EK+4fOKOPHtV72wsxcmoXSRJ5PxCGdkH+/MWse01DBF
         GNu+fCTLz0+cOxMwsTkJnmhdpx6g/LRMF42w3JMEQuoxFVNYx2neurdGI/97hpo8iFD/
         5pQUCrWMHKkrM81ka2gTYV8olwJb82vnESrtod8AJ4HASOgGllzRrsSt85GZjeGZ6/r0
         kBLA==
X-Forwarded-Encrypted: i=1; AL+hErHi+Ca6a01mugk+aW/91ilncRaADM+a7Qrx8vH1oY+RjNcInw20kgLjleqr4eB+fWUyI/5366ZKGIZ/oQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/+jC68bx+CBHEHqe02ZVFu/CJX+icl1CjcCPal9mT9m6Juwwq7
	KRCLrmrvxogGnqgGW0V4neOUMo4RC2WYF+YsDTYFOr/I8Hke4wHddwVk
X-Gm-Gg: AYBFou13liS9+eVgENYKs/xlEUOSCHyaaqAnQRaXLHm6L0nzfLyDfvzKrdNYLRzxXqQ
	B/0ijUYnKjkgHDyk9+smCHEMC7xrUzn1SuB+8cQ+8X6dKaWMnd8syiKQt4aneIbK94bljZOi+lw
	nZsUJoEdup2084eox2Mx1gs6lvNzpQtOy8EC/Dab0wLKjnNIQEKG9u/7+JnwzEdBfODijOc1rB3
	zPeIirbZIgVrg7NSy0CGBIngKCxoHParm1dCxgVTPwbUAWXQNVhfxzwPJLGYeU+HAp0nrAX7Sqk
	9bCfh2zH7k1D3pZlpVOwj8r0HH1p6/VmkL7HpvoOKxej6iQT49ZlVTi9uHGcehiQe5RbTdcUSBs
	EwzfsuQwI0bxgsbsgl/7NP1GOLRs+mXb9H8sCrc54eEbRHi3gxiTC5h7oEtrDxFDueCGsQbCyQM
	nhB9PksNMordwSgHHJwJvynyE1A3FMDLeodO3MuqIj6LJCFvmWPTVf/uzEt4V7KdZmLt3XayAXy
	ddbPC4tP0ibddlX/tNLR1HlP24TtPhsbR0AAT9dteNLsyDiyU5uAUCZMiE9rdBCVGgl/eb5hqqb
	V+aAmQ3xWxDgjZvpMUvQKaPeRYmOZnhXJrQodjEypRR7oPFJhPVmNEnPyBS8BmyAXqZaCD+QsZH
	FLaktV3xxdBwhTJc5Ew0ohW2cNqjsbOb4StqB9P4TGDbP5LJf5U8iYVk31wrJAY3oQEKb4HPbQC
	9xbIgAvVaYwN3Yr5LhqIlK8/nO2sIOluW6ZyupQ8EtZicvjs5YKTG6iMRifUq+pt5yf8CvHVpOs
	MOS4ptM1rpBBouy6yMpQ045z04CmTkcy+nMcaj56JyUbQ==
X-Received: by 2002:ac8:5d93:0:b0:533:39bc:efec with SMTP id d75a77b69052e-55d76938609mr70320971cf.2.1795196426393;
        Fri, 20 Nov 2026 09:40:26 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm28110831cf.28.2026.11.20.09.40.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:40:26 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] media: qcom: camss: Fix the X1E80100 lite CSID paths
Date: Fri, 20 Nov 2026 12:40:23 -0500
Message-ID: <cover.1795196107.git.jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1E80100 CAMSS resources, which Glymur reuses for its CSIDs and VFEs
(also with Nihal's Glymur-specific resources [1]), have two problems on
the lite paths:

- the lite CSIDs are given the full CSID clocks, so their CSI-2
  receiver is never clocked and they never see a frame;
- CAMSS assumes CSID n feeds VFE n, but X1E80100 has three full CSIDs
  and two full VFEs, so CSID_LITE0 powers VFE_LITE1, CSID_LITE1 has no
  VFE to power and CSID2 powers VFE_LITE0.

Tested on an Asus Zenbook A16 (Glymur), Linux 7.3 with the X1E80100
CSID/VFE tables, streaming 8 frames from the HM1092 IR sensor on CSIPHY0
through each CSID/VFE pair with media-ctl and v4l2-ctl:

                     before          after
  CSID0 -> VFE0      8 frames        8 frames
  CSID1 -> VFE1      8 frames        8 frames
  LITE0 -> LITE0     no frames       8 frames
  LITE1 -> LITE1     -EINVAL         8 frames
  CSID2 -> VFE0      no frames       -EINVAL

The OV02C10 RGB sensor on CSIPHY4 through LITE1 -> LITE1 also goes from
-EINVAL to 8 frames. libcamera still captures from both cameras. I ran
the same tests again with Nihal's v3 [1] applied and the board's CSIPHY4
link on port@2, with the same results.

I don't have an X1E80100 machine; testing there would be welcome.

The series applies on its own and in either order with [1]. Patch 2
touches vfe_parent_dev_ops_get() like Allan's "media: qcom: camss: do
not fail CSID power up without a matching VFE" [2]. They don't depend
on each other; I'm happy to rebase on whichever lands first.

[1] https://lore.kernel.org/r/20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261111135338.27008-5-allan@fatecpompeia.edu.br

Jesse Casco (2):
  media: qcom: camss: x1e80100: Use the lite clocks for the lite CSIDs
  media: qcom: camss: Map each CSID to the VFE it feeds

 drivers/media/platform/qcom/camss/camss.c | 54 +++++++++++++++++++----
 1 file changed, 45 insertions(+), 9 deletions(-)


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.56.1

