Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8804F55D1
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572054; cv=none; b=kqvxZ3z/FdIY9gNyWVvrDXIevwptGN/v3saAyazTOCQShk7Qq2JTf6Rdq4YU6hNcxzfofqC9nt3/pIi0u/RSezYXW4vz5fyGh4eJVEzgSXPON5TA/3qoaWk1jwnzyqIQXntgzDORCFXHguj7P5RCHhElIASTO0qcZtXQPekRBvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572054; c=relaxed/simple;
	bh=lmxhDFn7cl1mAZO0Awydg+q8cc/umZuLDwxopPEZSoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=U7WeDDdFy3Qyw6UrHMJiQ8t92iuDynCFMOrfpXEJD9jwTeMZlqjXIXNDU3twgyu/Swd6cBZZACpH4bo5pHkay0HIa6A027m5RFIM2arfqsQ+7SEbvrA2uPVZYIQCsdA2y/Be4dDokrj8vXvdb92sublEwieJs4elPx9oLGQFbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gEKcpZFu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gEKcpZFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789572046;
	bh=lmxhDFn7cl1mAZO0Awydg+q8cc/umZuLDwxopPEZSoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=gEKcpZFuXR2vsw4rTFGazgoZ+CyLSF8TAZ1RxgnVc9BS55YWDcdHP9GTl+4eckBQx
	 sY3YshFb13DLgq8wQu/iBk4cGIMUzZIk+8D27iNvTFG9lDUZ99IG1WXEK0diD0/Bte
	 SDECQ47z55htZ9cEFdQbikCrmF1h51gu1a/5pS3j3MfkQugxf0wSYpcb9rft+2xcoz
	 xxkxvtmY4fRFzWSjvPT5RBaUG4XeH+qWKnavqjAECXy4t+UhoJ4MN84WTmrjfrm/UI
	 UucyYSORmDArQyyS/x56B55uq787pb+v/kup5gT2V5uHSetmiERSeOG1V5GrgoPT9I
	 Pojhf9zLVxKcA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D71F817E127A;
	Wed, 16 Sep 2026 17:20:45 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 16 Sep 2026 11:20:44 -0400
Subject: [PATCH RFC v4l-utils 3/3] README: Add v4l2top util
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-add-v4l2top-v1-3-470629ba5ffa@collabora.com>
References: <20260916-add-v4l2top-v1-0-470629ba5ffa@collabora.com>
In-Reply-To: <20260916-add-v4l2top-v1-0-470629ba5ffa@collabora.com>
To: linux-media@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 README.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/README.md b/README.md
index f3865e2c..de63ec48 100644
--- a/README.md
+++ b/README.md
@@ -293,6 +293,13 @@ memory-to-memory stateless video decoder interface.
 
 Installed by `make install` under `<prefix>/bin`.
 
+### v4l2top
+
+Tool to show media devices hardware and memory usage for each opened FD. It is
+currently limited to v4l2 memory-to-memory stateless video decoder interface
+
+Installed under `<prefix>/bin`.
+
 ## Utilities in contrib
 
 Some utilities are stored in the `contrib/` directory.

-- 
2.55.0

