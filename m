Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A550349EC75
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613781; cv=none; b=XZpTNvH1zb97l5in3ITrKXUqtlBDdYjR0PXHGBUTBvQKmY0g/a/Y2KJ74F1rKXyT96PW3IN6Z3k/9qS4oz7/WgcK9IUd5XW593ZOkcNNMUYvXrgFrSG0HGuNRR2BonEprGdAoCPz8VDA04INZx41f+V2WiIgB9SFHyJ8VzOgYgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613781; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+TgjJ4dHBsfTcImtI3NqxtjET4ABZOFFMtUXibYrm/ssU/g7VOIURHZ3l7+PmYV9kGSPYaXAGhDO5SUfsQXzRQ2MGkxFQ1LxibuCj+XxTcXU7saGszBTTXzBnSw50g0aT5hiMBxCE9OKgx5+wmojv1+TOlvloEr8ufFTqAmaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhrLub8r; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhrLub8r"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-78677e30980so625837137.1
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613778; x=1789218578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=jhrLub8rGB/qkgko8StWC0UXVk/WLciRA/XMwFYKEm9ml7OzapL/CINgFYhVGbU8yi
         HySjr88fwH8SbE1onfmVm38Kh/Gsj0xVGrGoU4cLWY6EUMf8lSmYFb+4uFPwXn7krrje
         +2qns6l7Rq7/htJz4u3UaeTBNV9IHtCe4S1G6BRXQKXE4cjD+aJXxM5TELPTW0l71Vg4
         L3V1oJ0wGxJCfBJ9yo1MoqZdCHXd9uWys7tR58jnbvnIDQFVdl+vd93LoqS75tNRpU52
         ZWpL1btHyTeCnqvxSO1kMXOzk2bq8x6Q7RHBt5A10f1WlCdTGCaj7qin8OYPcSbhIf9Y
         0QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613778; x=1789218578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=WoXEnkhyijOkGa+KpvoGOKddbhqUHIpBu/M6OrB4fCc2ZVdotSvISJnkbaix9ilLuW
         bgSzCW4zFo6C9lR/va1ZAP/Bpciy93lZ6cWLPsyXNTgUMjqaaJB1XOX3pm8Kf0+2lgjb
         x47LG1nUMYOAYvn0VxnWpfhmgauiFSW+sPd3Bl3W02AFxxw5SxvALTXC7nEj4oKTMHQu
         BzijkrDhXr+fBUoX+pjNO36xHDGXxtnnvgBhZsbQSQWK/CVNoROsJK01JbOFyHxcqCKg
         CLWRgm9+nluO35zm13dL5QRnVcyFeeNPpfTHwVtJX35g6ubgN4KcwegvNlBlbD38+uLt
         zjfw==
X-Forwarded-Encrypted: i=1; AKwUvBzja4+hcuQ/Ocuk7sMIdXDWRb6MQcfcnq+XJTGsQNeqWh5kUXQBl2rxB+2G0BMXDry0uVSvGeq+lB1H2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kHH4e1Xd9ilrzO0iHdIGqlug0CieBoEdcyyGGZgYcvdTEVGLAe
	Bhj0dB3anhA9Jqn5JVJ93v3ssELK01pwVlyTuij7kglGqGgRW8V7wFkC
X-Gm-Gg: AYBFou3+3YoD8lOzbvbd2vEDwhu5Do7sWsBgCAKBRksUBwMIhhGSlYuB+SpMvlLtPPj
	HeAw0uAX1tV7gYwnAGoCGBCnfzXF4DfoR9BETLI5+6lXfIc3sS0MoRBgW2ScJJEH3XcitxUlS/w
	lhBB28l0yTm6P5Yt5KC6QKBj/6GzMajJ7W1LCMvP5gRuc9WwclcNKLwWVhuJzijlmy60CKP0nMr
	O4kmYpAL+5gETZcESMTTBMtD/YCqVeQ85FvYP9U8lB/Zd9OcGJ6I2j3zHZblYB8z3DidDq6hh/F
	dVRzoeLm0f+qWm62OAguDdBvjgCaLKkV+AMuSN98FEcezggZykA1W5TluIidqXT5yJ/m3B0IkGc
	zCVnfIDq1f8xle+q/xEjUUI/pxJABhaLYQsIzS+Lis75TXiyiaInniXEGYv3nWg5EpOUIryhjTQ
	b7Qzx96n1e+abMnc+8l21c92D9gUYl+sVYwsx3tr44P5menulr5hdaI4V+tQoxnfmHR1KsiFzTa
	+/HTxaIIRInaPySGDIvP11inQ3HBc4U/QD+rdts1aU=
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr3774484137.0.1788613778353;
        Sat, 05 Sep 2026 06:09:38 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:37 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v9 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 10:09:24 -0300
Message-ID: <20260905130925.7115-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

