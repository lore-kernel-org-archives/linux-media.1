Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA83793D0
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 23:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763376; cv=none; b=q651TZHGPQBk6q34S1sulbHna2TSPwXVLjQJj/JyIE2h9jbA+ixMvBvYCna5n9qu3RHOYTRE/IORUMHXn/g9VCM5uqrNeO0QfFSw0jsp21ISsyX2PHQaDyF98U/buD48AOTJzaVbvaRv/8C0871Ys3KdzzzdqOKLde0i1d0BAds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763376; c=relaxed/simple;
	bh=/WNSjUiB7ZBKYkg1c73HlDQeL6X829IxPmKArxDi2w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7IGINMshxX1FZS4fk7oSxij7nTZRpRQxwBGQGJxUCsQ3Wb/WVLuia88eOIC0imncrNyYBOU7iDQ5yC10Q2Ivm3SdEprkEoFDbetlHfADGJaY6OLiG6ZZgfeiB6FgC0R9wcDif+4c3mOiWQVN2grBDydYSHItyQmlO3cCormxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVPI4BjA; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVPI4BjA"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81e9d8f3289so694437b3.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763374; x=1785368174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=qVPI4BjAZdNd296OAWtBrEa9mj/aymYwSGN7PO4xQtoFTjzc61P/4Nz3vVFZ2glfz+
         V2x+FwB9opeXcHmCvi/dO6x6MphFaegzjC45cVGgcg8i7I+fXbFJyaDILZW3xi7nD5nh
         5Hin3GAPPi1mm45f1vV7h465UaGNE9Dp8AoNcEIzNRoTEKAus954L2Wxpfb41YA+Wdc2
         fpBDPtBt2csGRAXwt0wwAuIw++JvagRVrGpb7PeL08JJC55pfFQHBtzfDjzX6UPJ7QL9
         dR1cRJ8el3oMTTWF+T677x3Ru4zBbJfCu4P9aMYCPgh+70Ez44X6AYgiJNIYI5yLROR7
         X1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763374; x=1785368174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=hE+TSRyQ6AhJTuWBo1fIh2jV7btCpwRI24NKwhP39un53DLxd1l7fsnEZ6lsnfuR3u
         Aj3Z9pN7fIhpqnw/0AP6hlOGkVvV7noPF9CnJJPjV2caNwtNiHQiasC1BWkXm3Ufv4lc
         7cuSWZq0d9rN4jv7w3HwU/ee7H+8wTxgyGEZ/wI0PAdKnXtymp/745+HdQzZJ93Ub/FS
         ZquF8vqAQbL7Le5wrqnPG9Yh8wID0mZMLqlnHfsV+vVYyqaXnBf3K4UaHYdRZjdR0t5V
         Z80G6Ed2yCWffhluBDEZJYxKoFP621e5Yozb1tA+O2LX0xRIJdRNFWmiMGSpH6Zam3nn
         dDqQ==
X-Gm-Message-State: AOJu0YztvZeZ5d+l9oH3WXHYLS0GZUISwo2kDVWDgPR51kKInPcKXolE
	fFd4Z5ne3yWwnjVhETTyFc86pjSbhr3xEXsWdRlO4KIMmulUGseelfxq
X-Gm-Gg: AR+sD12Q7SWPBWpQ2qG7t5YQC1frdtTIRUCsqse28sxt+7196psH5J/pD0zJwhwYZ2C
	5tycs04e6U2qIfpqVCjhd3YGp98SodN3JkVlbwE7ZKc4dWaWQ7awebSR63rrHh1+5/6X5dWabFW
	QucvS2hkv3d/G6E4pkpDT07SWyRou6CASBkJ+AwyGHJfmiQUxzDfHKJSxGjndJp3h/c/movKflA
	dP+squhvHs9HRxThUTS9tiVK4hY5obTYxMeVmPPc8rive7+WDzgmbpsV+aHLrG7AkSi8Oja7I49
	zhqLe5KZcQa5uqgpTVVSOKrRZtIpAheYzRb9OjcA8c4gB4j6q/Cx+XYdddieKvDVZLyNL8Ehe6a
	1gkdu6RqsDV9xqqI5nyg+yW6CxnQp0SvWo5gbWV+R6IgLUDXbsC8WKM0KZAIjq5oDQHdUoFrBXv
	EB0pARVpFlHG0w7yaU603pMt3RCVASx94sx4lE
X-Received: by 2002:a05:690c:6c12:b0:81f:4247:de29 with SMTP id 00721157ae682-81f4c3bf31amr2438677b3.68.1784763374425;
        Wed, 22 Jul 2026 16:36:14 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:13 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v3 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Wed, 22 Jul 2026 19:36:00 -0400
Message-ID: <20260722233604.3001063-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Quick series respin for easier application.

This series adds support for the CIR receiver on the
Allwinner A523/T527/H728 family (sun55i).

One-line function name change s_cir -> s_cir_rx at Andre's
suggestion, with his patch for the Avaota A1 applied on top
for convenience.

v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 52 insertions(+), 3 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.54.0

