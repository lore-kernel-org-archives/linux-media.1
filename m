Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4BE30E82C
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856704; cv=none; b=C+2BVNcTxVM+2euq+m/GtjpFR+un3/BBQV/Fjmk7COdmgqhNYstHyuZADV/lIriUqCi0TRuhZ2FdADEwcSAUVgJt4GTKdcHngUZhXpPmYuWGa8jgFdchPbycW+/MpSwAJXe4o0czR76bJGKo1bZV7QXLE+lihEbjpx4iO7bQl6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856704; c=relaxed/simple;
	bh=NDbOLScMl0/An9PN63TkxGRmRSJ3jMWxr3my9fbJMDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0r6l7FnMzW2n+ky5geGwqqng6Vt8Q8BmRTvwRvykeQTwim2oevZQZHVaZ8xgc+JvXT6g/TKTC23j/YbIwF4Jp2W5S7wBi2QHOuTpswleFJCa2olqdraC4JMY7bWzAA+fRk9RANVeGfqdRsbLDVdyjS4rleVngPQyMt6Y/lU/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM/ppNXo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM/ppNXo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6fcfcdb2bso12736595ad.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781856702; x=1782461502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGXrYKZAprR/5Pxk3naVQXCF2pKtZKstOHwH49PRnS8=;
        b=HM/ppNXoRwJUyHerJoF5zhnG86GMeY5FJUm6h4v8tZz+otL2im7CZaHMpIgPmVnFK4
         R/9Fkf7U9E9F9IMYgKFlo0e68/XlZB9yZ9nzk5fwhmRVN2JVxT2ZNb8pH37gpFDDorwW
         oGOFnZSUazABI8AVfr7qFLlbsCDCSx+g5DddSzz2qp8QuHfu02IVyoh3HrJRkOUXrn0L
         OW9jaaA2/WjXa4kB1uwRQMe9NLQN8Q18pvOsGZ1I/AN+dhVNFn115+hrAM7QS18nj4EH
         OT1ObqpMa7mN8h4uxoHQ5xRqDQghuwXRYYjHBsQr5MKbHjJ2sqAfdtdFIU9F+Jz+9ik2
         DxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856702; x=1782461502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGXrYKZAprR/5Pxk3naVQXCF2pKtZKstOHwH49PRnS8=;
        b=MInQJWHiJ8Npi4sHAC9ejRM3/dQq/1WMphKcub+K+heRsQDBqe0bGXzOSS46tZ01RL
         xgEX1AOCJudyAwnNXBK22o1YkyKz/pJrKjcLV0k/MEgBCF2e5Brmu5Bt4zNwKhySKBNR
         Sv6ZMrcYJ44uYgmyu1jEnn+e4a6mux4FQKxpMSsYluBOfMWZ83ui7MZL2rnCAIUdyHde
         HQZfKztvhBbR7J4iL4DYxoFthge2OQQlYdCEzMUOpQrsUE87HhnExthwffrOsPp8aS7l
         kUs/Yz5XVkY655eT+4GyQ3XTSIydl3K1NR86PVoC1mnltCzSw8uJdGwbTiU8l8eF8frW
         7ZQA==
X-Gm-Message-State: AOJu0YzyNp9QbwV44JuOikECNkddP+q6XWsgzJbblLpjnylKXUv2m9nR
	GI4lldjM9R7o73Edr5hHahIPlkMxOkmhD9GNssf80+XsTX6zmDs++FB/
X-Gm-Gg: AfdE7clKOlh6MR0r+Sl9Ne6V5GYL6fa14Qvq14tB1mWdoFyZ+qPCRL/2/sXsx1xmEhD
	OBx313G7OKWyNLoigJ9SPJV8cMwskP9sraPZKkEvrbE4Sq3fjMFoW6nswTSHdzN6NEnCCBOiWnf
	nwGuCoZhkRDjjBkDHnVK0nPj6S3+gwSCLqjP0PQ4P0gZb0gPuOOJUXC6YGyDQgqrD2MnNjAopMg
	RySPjrTBNlweqch/mmULc2r4JYoftkBLGOEpvZrNGrxc8JaKFGzSk3SKYbgQXc3ZRAiKvM3LPBn
	x7QrFKL3Bf+hEqu1PjjwiH0VJMWKQsKt6hl9PVp2OSaOxNtLNZ0B9blYwbBvHgxJySok5Mn+TEr
	8nTC8v1JGcbBLoFlr/AH4v5k/+MuokRqvMppcCd01RlqT44MIfT8TjNdNTa6aa4llTYGuYUCykz
	Ydu+8Q36LqMFYzFQ3WiRTf/S87Cuefbd8sOgue8OnEuw==
X-Received: by 2002:a17:902:d54f:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c725df94d3mr17309855ad.37.1781856702379;
        Fri, 19 Jun 2026 01:11:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209e2f6fsm14797215ad.59.2026.06.19.01.11.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 01:11:41 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2] media: v4l2-core: Fix memory leak in v4l2_fwnode_parse_link
Date: Fri, 19 Jun 2026 13:41:30 +0530
Message-ID: <20260619081129.18485-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In v4l2_fwnode_parse_link(), the remote endpoint fwnode reference is
acquired using fwnode_graph_get_remote_endpoint(). This reference is
properly released in the error paths, but it is leaked on the success
path.

Add the missing fwnode_handle_put() before returning 0 to prevent the
reference leak.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v2:
- Resend because the v1 patch was lost in transit and did not appear on lore.kernel.org, causing CI to fail looking for the message ID. No code changes.

 drivers/media/v4l2-core/v4l2-fwnode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 77f3298821b5..93ef83c591ef 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -633,6 +633,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
 	if (!link->remote_node)
 		goto err_put_remote_endpoint;
 
+	fwnode_handle_put(fwnode);
 	return 0;
 
 err_put_remote_endpoint:
-- 
2.50.1 (Apple Git-155)

