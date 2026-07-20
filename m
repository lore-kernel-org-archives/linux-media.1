Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0F31AAA3
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 23:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784591442; cv=none; b=Rz7B0juIJ5ZJEgflp0LaRO89YcglBTSgAxFyG+lF9rAGB9PmmXs2CUSISXJ3xCh/XALkRZUDTWiODEHtGQTS6lwqWLNOll8MRyuINbr67UDR5EuNJkwzLa5INNRYWP3tJxqUPVbBDLggV1S2LF2Z1aXvQMuCKsZSnS5POdCrIcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784591442; c=relaxed/simple;
	bh=TMQAMi41haTFShdYhwA9ecIk62BAQJyNMAjn2zRy9C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tx9T8Xnfa8bL7tEuU0HwTpOXk2J9JO5xkiC0MrfcYNzykRS3QTPQ1WB0wvXnaP+vTEQXyjsKkHbjWT52tcIBt/ooKomn4ytCAlQlVKOKwI2buFYYxs4RaOzfh9Gy4KSOZ2VUuInmxrm9pS7vVor8fP3Xw4ZaaNvsFENRL4RFM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q60gXTSd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q60gXTSd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4955de8797cso9141945e9.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 16:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784591438; x=1785196238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMQAMi41haTFShdYhwA9ecIk62BAQJyNMAjn2zRy9C0=;
        b=Q60gXTSdJqTJOWHPD+NmvlLK8mHHVfV3dyc2vo9QPfWUIC9Oaxjj7x/dWLc8Gyd/eY
         2Jv8QmhhbwCn06AjE6FThlLndkCLcCW5WiSe+a75Vglh3qs66Zv56PYWlH0cryGxGk/E
         1P2eCSGfNZIfQK/+aXlmcOFq4OyKA/WUr2lNZtwfOZTE656YTBk52Ods3QjYAP8C2OfN
         V+vMWRMXlDWQ9F2hQg5/DEcs1yu6hKqiIlByAhi96Z++9tezlBUd0KqdnuQ1LR8Zw5zK
         2bzgN+sDEAv7yIdIud/G89+7p78bJwur9LxkCICVKTwpMj2QuscJij2b7lNVcQnyIukj
         /RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784591438; x=1785196238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMQAMi41haTFShdYhwA9ecIk62BAQJyNMAjn2zRy9C0=;
        b=odpvsm35GKGBAmRCbzhfZ87WZojR88TCTxIUZDOAphNlxJAIQyHV2VH39pvlKGglkO
         xygfXRoLsY7LGEbxN7y9pg2gcKKsSXRreHJNM97ojEWzO8lx6wFhUJvcU91VecvsS+wi
         Bs2WxuxS3GzGYabi/9V6lf3BS0UA2htCrcEEbRBRNEipTnLPOwvXbsz9tfkdPC0C+X+v
         IH+HpFKz9nn9inYzRYD5SR/udKkq0AGp2YenyAEclvIW571fmkspnAHWTZiPBG6wCYgP
         XxWdVN+WmVEfdXWOTHSVPqCa1ndw1Yk4gC/15HIrmqM/pAZjdEY+8g4WjLBYfafoCyKW
         L0mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIHg3Oda/vq+MkvBO9SCUVoO9nbFTCrYtbhCCQyUC+XJ9R5G+o89gGh/+zMZSXC5O9hkpdti4lq45Y0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSYvFQci86zU84higkIfxOTyzPflkJeIp6PHFjMA3O0n35QUt
	+uJ6uuRjnE0bLVVErGY+S/QJXYiGGH2ErT7BMSC2oD+jnJt3OnIcsEGe
X-Gm-Gg: AfdE7cneXFUVgw3ZYGbulC6uJW5IgGDn7p4zSfF6UzXzuynsssNWpaOPpjxlxMl1a4d
	iA1DKhahaM6W+CqqtzQkoibLMIXL0ldIihIHmZ8ARmdOit87soeQPHTuqH0pXxs0y/3CUP+QRZM
	ukPhgEPWLa+ViAnJ7w+l2l0UzvHot8dCloPVk1ZLJwRo5FI0mcMRP28cVM0esGAFXBNcjKIxi4U
	R6qJYhnFY/YIb5XrPHRkGdlsBH2VoCC7TXpy3tkXawOxBjPe+Vf0hrFGH4WQRkiquK3wo1GWQpG
	1VhfzLSZi8NQGHHhUWSa+Gii9tx3VM6t2rce3QMY9p+GrHK29kuhhSZddjrVh/93C7deTGdFrEY
	MrX4UFWoZJ8Tx9UL13KQXVGPvwBWNQ4d+IUkLzGdntfmFaiskjqK8rlotLoLQJv07UgXKbpaXO0
	ufYF77TZr39calvNVlwby7Wr055pYv90dAhCWyow==
X-Received: by 2002:a7b:c054:0:b0:495:5172:661f with SMTP id 5b1f17b1804b1-49551726896mr92898095e9.19.1784591437637;
        Mon, 20 Jul 2026 16:50:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:62ef:2bbc:fc2a:fef4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49558cb8433sm109324555e9.2.2026.07.20.16.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:50:36 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Tue, 21 Jul 2026 01:50:17 +0200
Message-ID: <20260720235018.11077-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <13d6659f-4b51-4041-8aff-70b991ac306e@ideasonboard.com>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com> <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260720163819.104130-5-fernandorimoli11@gmail.com> <13d6659f-4b51-4041-8aff-70b991ac306e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for the reviews on 1-3.

You're right that keying on both the PCI ID and the sensor is a bit awkward. My
reasoning for scoping it that tightly was caution rather than a known IPU3
failure: I only have IPU6 hardware (Surface Pro 9), so I couldn't confirm that
gating the ov5693's clock lane is safe on the IPU3 CSI-2 receiver, and I didn't
want to risk regressing the existing cio2 + ov5693 users (the INT33BE Surface
Pro/Book devices) that work today with the free-running default.

For what it's worth, from the receiver side IPU3 looks agnostic to the flag:
ipu3-cio2 only consumes bus.mipi_csi2.num_data_lanes from the parsed endpoint
and programs its D-PHY Rx timing (clk_termen/clk_settle) the same way regardless
of V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK, it never looks at that flag. So the open
question is purely sensor-side: whether the ov5693 idling its clock lane in LP11
(bit 5) upsets the cio2 D-PHY's lock. I can't answer that without IPU3 hardware.

If your test tomorrow shows cio2 + ov5693 still streams fine with
clock-noncontinuous set, I'm happy to drop the ipu6_pci_tbl check entirely and
just request the property for the ov5693 unconditionally in v4 which removes
the PCI quirk and is much cleaner. (The sensor-driver side already no-ops when
the flag is absent, so nothing else needs to change.)

If it turns out IPU3 doesn't like it, then the PCI gate is doing real work and
I'd keep it, but I can add a comment making that rationale explicit.

Either way I'll respin once we know. Thanks a lot for offering to test on IPU3,
that's the one platform I can't cover.

Thanks,
Fernando
