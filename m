Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A674E3244
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661876; cv=none; b=EQKmT5E68FM0VFmdDr3I0PqAeleh2tvbKjTZyO9/owv1izNFXyHnP0ckpbYXZsOEm3X2KUyJClp6LFPDeNGj6gJvL0lEp4DGXaiNb2L7k2NqQqNHIPBHfjcZE0UnvfLsZfNzfi65RPFSYjpNq9SX2DtSzIWHRNRaVnb3XRf6F+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661876; c=relaxed/simple;
	bh=lmxhDFn7cl1mAZO0Awydg+q8cc/umZuLDwxopPEZSoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=dtVkGui9c9L//mRgSLevVbCcT2kwXb+noCrIDhf9jZ++elFF2obGStPtOgUSjqoqF1CI7Ald1/rkWC/h4F02tEBcqjqNjUivxG7rZw2E6OqTj3g7YQaGF5wmKEOPjfm/vxwI7US9I/GFyOLzKO5dpxSuO8SFMa5mX9Ox3UxwVMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DW0lZHGk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DW0lZHGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789661871;
	bh=lmxhDFn7cl1mAZO0Awydg+q8cc/umZuLDwxopPEZSoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=DW0lZHGkMLfenMeTaoyAU2OQSFXrUnCxjTZog1KX3+2SWkp97Fr0SfdkeWaVls+xf
	 BlXl/eQedBY39wKF35E7vrKdZHQCHZQloPkyptNQ3mF444L84caTRwZYLFuQhS6L3X
	 8sYxQw7/kDhSvGUdfUQVJ4l8UJdUjn0B4gHJa0cV9fLOMYC5byLIC5I67zbgwIbJsK
	 v0BV9pN7sO8hTJylz1Dt84ql/l6LuDZhglqJn3CAi+ZixFTEbFi1H0AAsY5LMmdf1w
	 0OwVWudG/0cr7qc+bFMLQguRpURVPtxveT45Cp8msWFi7effstbJdSqpg+nAKdR1dL
	 bzH9RRTqh4r2Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6863817E0CFC;
	Thu, 17 Sep 2026 18:17:51 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 17 Sep 2026 12:17:48 -0400
Subject: [PATCH RFC v4l-utils v2 3/3] README: Add v4l2top util
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add-v4l2top-v2-3-80970c6210c5@collabora.com>
References: <20260917-add-v4l2top-v2-0-80970c6210c5@collabora.com>
In-Reply-To: <20260917-add-v4l2top-v2-0-80970c6210c5@collabora.com>
To: linux-media@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.17-dev-4066f

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

