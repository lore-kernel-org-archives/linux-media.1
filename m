Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA921A6823;
	Tue,  7 Jul 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783445818; cv=none; b=jyk4kRTjxf1NVB+E4QTT8ZsITknikHGGA07sAfDsJZXyEcT32wNCh5a7Kv77VGGR0MMGauM+cGTm/M2d3dt/F/utvdPe6L1V9+QlfJhxeZNbZB3u72AhaWA3/FpmFluNudbCb9Pl7Dz+QrQkTTc6RuQ5ZCZKbQ6sYSmu9WBeGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783445818; c=relaxed/simple;
	bh=Ib/vVqcal4j1MGj8D0TYa+zICO91dCuZmlsT4KqrO20=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kbhe1D6CfBqyCa33ahnEuScufC0CJlEaP5FOC7LJlhbqy4ULa5O2K438sHokrcUSsPzutOXWkFyk2hfOgmeKVTY4db814wRw1+JOafjeAtRH8BCB04DeTHFYn7rs/nlhrLbkwGB/DxXNILvGCQKagBMNOfycldIs3iZOQVv0YBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rk3/UTRm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rk3/UTRm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A66E040430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783445815; bh=COXHWe8bmkjlnZivcKeLq98DBvhs3tW0/+YwQdc3IWU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=rk3/UTRmwQJgFwPjxnuOk8nvd6IPczW0ZRnxhLUuJI2lKSkc/tuTYIkJIykpMXW8h
	 KHdNGLyfbsW9paWamyXjGuOUuY8o6jfuK8aA9T6av66YqdsvyvYA0qPmGIdXXEJyAQ
	 cLRW18gw2+pDpjjcTDQsyU+YqL63JB72AgLYlSoG+NBys79xzQH4InPJzUTtVKOTof
	 DBLY6cQPeYBxOPeBg1opVkSzE2sdhVfW2t3xiPtvRv/6pYVgVXnYhf1oxkycqEiqJ3
	 xR1OA5YO8555kUaWG1dEMmKDNgEPSvRUh6bz6PknNig/u66IMir+TRRkEmfCk1Hvkk
	 1NLzgpNmKWIZA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A66E040430;
	Tue,  7 Jul 2026 17:36:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Lundberg Pedersen <dlp@qtec.com>, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: Bad wrapping in some tables
In-Reply-To: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
Date: Tue, 07 Jul 2026 11:36:54 -0600
Message-ID: <87pl0yr9ah.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Lundberg Pedersen <dlp@qtec.com> writes:

> I've noticed some bad wrapping happening in tables, seemingly only in
> the Media docs, but that's also where I look the most, after v7.1.
>
> See:
>
> https://www.kernel.org/doc/html/v7.1/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers
>
> Compared to:
>
> https://www.kernel.org/doc/html/v7.0/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers
>
> Other tables have also changed, but they don't end up this bad, e.g:
>
> https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-parameter-kgdbreboot
>
> I've bisected it to be f2679ac773899f5fdea0b68d5077eef5f88dfd42 that
> has caused the change, and I did try some quick changes to see if I
> could fix it for the tables, but I didn't get any positive results.

For future reference, it really does help to copy the maintainer and the
author of the patch.

The patch in question tweaked our CSS thusly:

> +code.docutils.literal span.pre {
> +    white-space: normal;
> +    overflow-wrap: anywhere;
> +}

That overflow-wrap line is the problem.  The patch was trying to improve
overflow from some literal blocks, but it does seem that the cure is
worse than the disease.

I've just made the attached revert - thanks for the report!

jon

From 1afefde902c5267d1197da8a3b039354ed771d37 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 7 Jul 2026 11:34:47 -0600
Subject: [PATCH] Revert "docs: allow inline literals in paragraphs to wrap to
 prevent overflow"

This reverts commit f2679ac773899f5fdea0b68d5077eef5f88dfd42.

This change causes truly unreadable breaking of literal strings in a number
of settings.

Reported-by: Daniel Lundberg Pedersen <dlp@qtec.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx-static/custom.css | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 5aa0a1ed9864..2e019c8f8a56 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -156,15 +156,6 @@ div.language-selection ul li:hover {
     background: #dddddd;
 }
 
-/*
- * Let long inline literals in paragraph text wrap as needed to prevent
- * overflow.
- */
-code.docutils.literal span.pre {
-    white-space: normal;
-    overflow-wrap: anywhere;
-}
-
 /* Let rendered reference links in tables wrap when needed. */
 div.body table.docutils a.reference {
     overflow-wrap: anywhere;
-- 
2.54.0


