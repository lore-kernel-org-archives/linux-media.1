Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1FE319601
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468968; cv=none; b=RKd9gmqvrqgWAYLHnrR46c/h0e6tbUVqij9YWDBhAeNEd6YLSsAO5OAZ9pmnpYPHg31JdPewJ4puZoydnJhRe4+DxVN9oWj9hjqCJo9Vj3Du8uz6vzNcF7TPPg+YJdDk9zNdj+e0NX7U0bHFN4nTLWtLEsNXB9GBQ5G4uNx8i3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468968; c=relaxed/simple;
	bh=3q56jea6IOBi0hmDJwPKOKOmrU/jW+5qhWqpcFffP1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMSf2uQOtqwkhbFZoL8KH3/a5vrQWf9HZbC79rq1n25saCnmkW4PwP0+ChBymY9CDR4p97EiMVWei/1jp+fnQqKc/2f7iWsjq56EglrUpRHWIpPkAQPmwofUXrKMTnhwfJFUJifKNIIlqJSsoPqV8lCXoZQZTp3Iy+vDRQ2OnDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bov03L3s; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bov03L3s"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso1682231a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468967; x=1782073767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8J5sWL27P2xSeVt7z3c8+kwAG/j8lXj7L6IdpNXA6Q=;
        b=bov03L3sFHQ5s3nQHW8CGSym8UrKDUJJ6swGAG/sZFYCvH80adgwsP4OQGGOYMfD1A
         jDi2qSlwP9dTDFozZ0SkmCy6I6aBNv7qVXfOffMJwIN5wKnb+kOiSGRXW9OMM+AQdMUN
         teI7zjkuNHuArquoyEV93oE15moy3YbRvhKFfNJYY5sIVCOMu4/5JmUgBbArZG7On7LX
         yauMAaA/a/41NzBflmg9lBQZdAYLB+1ZanEdmPjF2Sj/srJAiQIrrrxxpFPQ+LQPsVYS
         RRK3maZ/PtmPkXN2ZcDT2A1xv+kbV7OFwnxb2m0yAJXDsKqBonmkO/nvblNcd953LhDC
         vMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468967; x=1782073767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8J5sWL27P2xSeVt7z3c8+kwAG/j8lXj7L6IdpNXA6Q=;
        b=dmtHZU3zN06EpLsa+Zi4sddvEr4MZzzJpqZA/ai0QHE3CZ4tAHy1Vuo5IWL8Obhw9Q
         O25Z6Cs+lcX1le6p8FyC3GMSE8ZhhAXmlKpoYvSJaqezQsrrmVjNi2jv88mDtLUXthzq
         5ticd7mhIbJhiVIM7pc7UGsdKvumGxM0NKmlTm1DBfrRb0WD+8tT2Pw9KLoC2Qws6P2e
         wUcEnUAZj+ee7sRx28/l9pMe8atiFzGQ1RXnsDuliClLMlxECOLR5LgOGb2Kgz/O3UOl
         H2rTUZJgsSDtDY0VvpmeCzQF5EjvfS6DHcIgXpKHL9NJcvnmzjpIARrPuIZGfNV+pN8W
         m4XA==
X-Gm-Message-State: AOJu0YxbhRscKdISqZ2mLE2OGNqr26qI5X2zcrIrfGMyMMdjy7hpsTOX
	3igCI1KBSBR3LEAZ+ZinVfsy1FMOgFQhp3GbP/njnLJKvxbdTh4gvBsGXxH/dmBN
X-Gm-Gg: Acq92OEyM2ehiCXzJS6DQ52hpNok7iDsHseGGu1AJCN9f305y+W+wqxQhV+CCzqKtyh
	H7OxOrnDgjz0XYNqIkIk/82haw0CuQptJ1bHEc1Gq77pUjIObZqGAafNGebUyrqSA+j62ySveCj
	4GHqCZyB28Oar9WfDVG3J0aaKuiLYbUzDNHt5WUlO0cy0PNVfoM4liOr52e4x0UnBLXQV0oXjsy
	JMzJsniT2ettQ5u0pbEbhE2mXv5nCJrFAaoVVsYlwVre4so6nPHQsen8EWzjGaeq0tmmWjobXyX
	hGF1yT3Vv4pFbxKLnXT4uO4Qt0fsGL9v+XfzWoaNieV3UHM2+9MNrN4Lb3BJd6G4xL6a0ryUm6f
	IS2NvMyieW9GWgKq4TkyEWbBOjzAy5cX83hLYB8ncJOIsg4g1kjZsjQZ0IxfwhJSEBkTXAtWtoW
	A6qLx1fuKW0idUbyA40KdGIGVbsHvbrCf1hnOqvkUUiSKpY2iZzQ2U
X-Received: by 2002:a17:90b:2b50:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-37a01e2fbf7mr10722498a91.8.1781468966588;
        Sun, 14 Jun 2026 13:29:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 10/22] media: platform: rcar-csi2: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:10 +0530
Message-ID: <20260614202835.11977-11-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..c4e35cac97f4 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2634,6 +2634,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	return ret;
 }
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

