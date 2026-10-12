Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA703E40E4
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813134; cv=none; b=vC5p37+KRiIifyEubLgC2Vfw3aXBt3TAwzKBQwNaTrlSkRHtwr9GN3EJz4rSeuELQmAO1gvbxRBWk+/3Q++VOKRnHwHZivG8zQw3qutBF+zXQc9PGMp9K4IwI0YsQUMV90IUvjjW/7acuJQlMT4JG7JTBe0niXq5+Ro/br/aQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813134; c=relaxed/simple;
	bh=XW1djT0Vdpsbvd9ni2r7C9RCQFJQ6pGumgwaGDmtYY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K7fB/SLjCoilcdYqQyZs8W6iyDeJ4IpzfIiKtw6yRQEdrsgzRSKqdnUai+K2gBV2jDsmuphiSO7uJ8GR3NglCeGZAnb+EOxGluWZsGaa5K3p5j1S6hbmai+RxGXpd2iKEjE+8zksXFBnx7nStdOFZMQPexJ1oq1PCnpWZCMu8W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=SQ5ruEkY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="SQ5ruEkY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1804585f8f.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813131; x=1792417931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=09LAm3CRdRMlY+AjcF4iVhhVeJyo0GxMWk2sX+iS7gg=;
        b=SQ5ruEkY6qbh9w1Rl7hr7BEzBStb15CQw0+rvVEfHJodvgLk99/5YPeJxBmR2JO/yv
         0MVoM1kTeWQiRXmfEdK4Cqu/394ZU70HaPlw0g3cyXHQaEbrTRrbNn0LULPt84GTS0OA
         Vf8CMY7miG0i9rB0/FrzD4SKWUQZxJTdbOF+lS//8P8zdKnhq8GCbSZokOUt+AV689ed
         Sbxpw/tUrESR8K/ADXAQlOJOtUbj1CFgfO55EbZ/Nl2KKrsY8orNDqWOSJRuMl3GWfbo
         qDzTkpsP5VhGmfSJ8EBjOWE8NcDLukD7KBrWIblHKzxSJKrz2MNoDNNI6W02S9GkdaRk
         lfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813131; x=1792417931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=09LAm3CRdRMlY+AjcF4iVhhVeJyo0GxMWk2sX+iS7gg=;
        b=iY5GhjhhA6HmlaFUE2vAJo6HjJxnSVpsi/eIGjj1G1U8kBnLSKBW7crc6iiVaMigGL
         VqwT/HGl/1Eemm24v7WOPBz67666hI7wYrGY8oUy6VUBL4ZTCecGSKTqyqJsOh1pFWF1
         AyOCg6NtFH8ZP7meos44H2+sex2xj//rI4vhIzq2BQb5YJnSAThnYQ+8eVdGH3w93GXK
         lT2YniPahH05ivp8bRph87pgeqEy3lkGAk6nhF6tzHPYA+EXiKKvqDqXXnl0xgchni/2
         KhXidfSwjKyvrpVJFMGqNFEyOa0cAzZk8vsoyh26Fa6TM7ztTQNOJ2tLNC9X2Htn7tCh
         1/eQ==
X-Gm-Message-State: AFq9FYJHMlt4QN2Bim4aOpu1CcyzrW80IFR1YViU81d7tFxto4DrMYai
	54FZq0O89+w6NVGMyljUzRh+vGFepfmKNQYANDmOj2fXL6Ys5pEWcu2v0HkMfmuo/DY=
X-Gm-Gg: AYBFou3052iJBeLqONjdDuDaQmM7tLya3NkYQ5qWHnvCWi6zlQQUOeM8W1xKnHTyNwa
	2t8QmMpYw1bPo5WB4IwTvZrV6XkzVWsqshz1nD5LbXiNRkOIrj+YSZ/OIMt0QUgSyYbN50ZZOhK
	BMXX9kZDHYKjjGNnHkzoQtn0tPcM9AjTmBj+g922UqnREzbZgEY3uyANuYSjtxOkMFALI1zHxNd
	0PufOyNBSoLLCl2kCj1hwIFByFbrM+LmvrasPwPVglR6Q8FmPAzApkEg74LLRh0nfM/GSiNqwXE
	PDw6pPxkjDhHU9qrmwSzhUHHRTaoTEygdJm0eCh9x8LRTuK54NEaSro+/xz1VwC/04knAFdLHq7
	Pqq+veq+s+m9fWkSImxxwqPlCxrKyXLcEx5hLBgAH1melQhcv6jCKil22tsuVDu6GEWr1c4wK3u
	CyP4Yn1WluLss8/WAGGBBPZlLLmPif20frobBt7gdkHrfYlOQHreFLGRp4bynL8PqtIF8jP9xsg
	93u2KyGsFoyOSvF+OgRXINKxVzH+M/fUiSda/M4AJoY6my+Rw+YBeNw1KUgNtpsOEsDSxVsKSBG
	gWJg5XdEY9jagyUOG9bsy+j5lTUJQhzZ
X-Received: by 2002:a05:6000:4313:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48dbaaf07d4mr17559870f8f.37.1791813129855;
        Mon, 12 Oct 2026 06:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:09 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Date: Mon, 12 Oct 2026 14:51:59 +0100
Message-Id: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/lzGoC/32NQQ6CMBBFr0Jm7ZhOlUZccQ/DAtoCY1IgnUo0h
 LsLuHf5kvffX0B8ZC9wzxaIfmbhcdhAnzKwfT10HtltDFppQ4o0SrjluUJbBxFMU4emcaoo6Hr
 RtoBtNkXf8vtIPqofy6t5epv2zm70LGmMn+Nzpt37k58JFRqt6sa0lJNzJQeHyduzHQNU67p+A
 dWGy7vEAAAA
X-Change-ID: 20261012-sm8550-camss-tpg-6bd0991432c9
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs. They
report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
existing gen1 TPG ops drive them unchanged.

Describe their register regions in the binding and in sm8550.dtsi and
add them to the SM8550 camss resources.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v2:
- Added commit message to patch 3
- Link to v1: https://patch.msgid.link/20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com

---
William Bright (3):
      dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG regions
      media: qcom: camss: Add the SM8550 CSI TPGs
      arm64: dts: qcom: sm8550: Add the CSI TPG regions to camss

 .../bindings/media/qcom,sm8550-camss.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++++-
 drivers/media/platform/qcom/camss/camss.c          | 50 ++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: ba86f67908354f41f269ca1d64b22e4624766dcf
change-id: 20261012-sm8550-camss-tpg-6bd0991432c9

Best regards,
--  
William Bright <william.bright@imd-tec.com>

