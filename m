Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A033F888F
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092269; cv=none; b=Ai3ybw9pXzgnL2HAx71WM87pWFw0SX286oem6XJ8VjKj0vuf/4B86zECrbVC2eZP8xSb+mqT84wAUtieGmfgA9JsIFnvSuEbe5oB5Y6+Jmfy5UnBpsIJ4m3ot3DrCBzw7KSFl97l0BTpoYzty+2uVqnudo7q/AZd9IhSPziowVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092269; c=relaxed/simple;
	bh=pYgGppqJBjl7O9f0ZsR/3P9jK61RcTsDbxK59IzpasE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JY/XqdPKhNfSecYUfqJ45JQPjGYmzSswcfwTYfZQ+dOsehK7T0cNr0SXT0pr4zI22dl97XX5Z6ospI6qYRTTZ0kS6YjRM/lN4nV74nabEgNsehLDcNb6IY8QIyQosdVq7Dw+sdHQE7zemxHrzjSgUjnVwMXkkCJIsuwAVsHb3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=y1ZudF5Q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="y1ZudF5Q"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so4337877a91.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1781092267; x=1781697067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+blTcUrJKIlXgCL/CdRUN4lD5XyjCjVsFhKX65o82QM=;
        b=y1ZudF5QVJZLExllWCUJOj85VilYTVglyuSlSteDugSJkwTxVU7XqlEjkEWz7zAYTy
         nE/fCLUZXPj/WOXzJbo6Vyu0Ad+ZWZGrcjVMGfOSipIZBYmtS3VmNfJjl8SvhF21IQ3F
         nfhIvLLV0y4f772USwdIM7k5uSIrhqrV4EY2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092267; x=1781697067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+blTcUrJKIlXgCL/CdRUN4lD5XyjCjVsFhKX65o82QM=;
        b=rT5+1yiws+gNRUPpgSXz7V3MmQ3tuNWj9K6q7slkw8wQbboIfSuVzpdOgAjnCLi8iG
         MBSxmEKDd9ijeZuipe8gTI3ifUuMt4UQlbd7jqhR818Zy3qUXFFFuR2qQ/LIloL6T5sY
         i3HJgBdcGmUApUQLfuF/i6LEGN2WmaTaQOj2m/GP3ajLEG0UiNidbiZHZ09dAyYBinzV
         UruQfPDRwI3yEDqF71B1jskmZzbYPynSt5o1hn6Fasxq8aWqeLdlll+Zxu4FgBwVQyLr
         wUZFC3HuCIwWN73yd1VGjPN1bQsuAh37GKVC2zxlpxfoPBSvMxCJZTXECGxDyk6GvNgq
         5JqA==
X-Forwarded-Encrypted: i=1; AFNElJ+iDKgrSM0fkK51rhxskcuwaWs5F0om1csxptP4IGPhdvZLpBdPYl1J3dIK4TsOWezVs54HzfwHsr/ZFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIslB7UhHDEUD+ONlzU9FUzkesXCcjJnaGxBruVG8yEaIAj6w
	BEy72bsC3qh/yJ3pHUcWKOUIArU0vQWqIOY8kFNASKEaR+l2pbj2f69Z4uHhOrsYQ48=
X-Gm-Gg: Acq92OE9g55occZfEF+zdS6g1oI5SniIzOj3vU1g0DnN/Mkz20riV6tvvbiwySyQjlw
	fuK34DM7mll1PCuEiQ4sdUzSqXl5S9EX1k7R8kogzrelNvIry2gUTqj/Tkz+KVeW6Hd6NYs5fn8
	h/Rz5O0GpnAVRlfgp2XKQso8x9OGfz3p3Pu9M2NMmJdWQww+HM3iIBywaEBcMu3Sc8e1Yr6QcPR
	zWme3Qk9HzZzvUp339FQoFuN/2I+1VjOwyk8q1BwN2Nq3KQQ40nbpBTOY/jRX4I2pSPBun+Jydj
	QliLQwSZBrM8fqe7uE7MNAYV3ZfyP34M15jNAtB48rficuIIySTTyOdY2OuVnNIyRe8jKZ2Tbdf
	Q2xS54V0vWw/Q4C9SCEI1kyNp+ByYIeXAPW/mAwTZPeztZw+BWvMgQalW7LzM2hUUGWNwaPm+Rw
	VRs3fPf4L5P08/Cy2DhL8hPPkwqOmN3GZBGkufawLN7OLcht3HfBTD7pYT+4KAdJTAAGE=
X-Received: by 2002:a17:90b:38c8:b0:36d:b12f:613c with SMTP id 98e67ed59e1d1-370ef2f0208mr26384305a91.10.1781092267019;
        Wed, 10 Jun 2026 04:51:07 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a28c0esm23024847a91.12.2026.06.10.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:51:05 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>
Subject: media: solo6x10: KASAN wild-memory-access in complete() on early IRQ
Date: Wed, 10 Jun 2026 20:51:00 +0900
Message-Id: <20260610115100.758131-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

solo_pci_probe() in drivers/media/pci/solo6x10/solo6x10-core.c registers
the interrupt handler solo_isr() with devm_request_irq() before it
initializes each p2m_dev->completion with init_completion() in
solo_p2m_init(). If an interrupt arrives after devm_request_irq() and
before solo_p2m_init(), the handler calls complete() on an
uninitialized completion, causing a kernel panic.


The probe path, in solo_pci_probe():

    solo_dev = kzalloc_obj(*solo_dev);                /* completions zeroed */
    ...
    ret = devm_request_irq(&pdev->dev, pdev->irq, solo_isr, /* register handler */
                           IRQF_SHARED, SOLO6X10_NAME, solo_dev);
    ...
    ret = solo_p2m_init(solo_dev);                    /* init_completion() */

The interrupt handler path solo_isr() -> solo_p2m_error_isr() calls
complete() on the uninitialized completion:

    for (i = 0; i < SOLO_NR_P2M; i++) {
        ...
        complete(&p2m_dev->completion);
    }

If the device raises an interrupt before solo_p2m_init() runs,
complete() acquires the uninitialized wait.lock and walks the zeroed
task_list in swake_up_locked(). The zeroed task_list makes list_empty()
return false, so swake_up_locked() dereferences a NULL list entry,
triggering a KASAN wild-memory-access.

Suggested fix: move devm_request_irq() below solo_p2m_init(), so the
completions are valid before the handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thanks,
Jaeyoung Chung
