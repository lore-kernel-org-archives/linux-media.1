Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA936C9DF;
	Mon, 29 Jun 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731354; cv=none; b=aLWX6UDqetqFS0YRq1VhdB9mIZQRQyXW7WjdSsLmGnrsk5Xg1ZzQLnhj68Y+It4PJPO7TmHjjMxkXrXzAj4UHRYBBpFeKOYkrtCBolV2rHiTUxVac2PI7eGdsnTU3p5uiOXftCDNjCN4ygbJI34AkG3Fbst1PQxBRWBQlbFXLsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731354; c=relaxed/simple;
	bh=0JVaisx8P3BN0kvizEnsZWrMuJQmerA6vkqRIS0IYUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naMgM1rVshYQHn2djJJcPdUy7oZZaJPZ1smKYXwPzhRW7hCTUIRfkgUNIF2/Lls/1E4hYCamGkdy9u0mzLkpzx8cULiVn+2KPNcTpn+xDVjwfH2QBDMuKxidqpQBBCWoErP3+N8Gl2gFk7cPTx7bRq7EXOHQg04DrWAUbRioACc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IYO2wbW3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FOjyrO2r; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IYO2wbW3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FOjyrO2r"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gpk7B0m8hz9tsv;
	Mon, 29 Jun 2026 13:09:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782731350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Meef8qNImpDHUFJ5L/HsHQVGu/aE8D0eYWBfpqirRHE=;
	b=IYO2wbW3lu3B2+b14mV8+XPBzMZA9GzaqOVte2UtOCUdKgnQHkfU3kxaOy5XderPIrIJhK
	9H2mdjpo4tf+52MhqNNNMCmO40lOomSU/c3RqD/Zhj9UOYxtyQkTcN65ZadexpDKocbGOO
	5HRos1HsiLunOhCV0CH5LL9nrL3gF0pwWPJMZulULYeTAc0WuQyimLoYGJYDscnygPP156
	cblZ14AwOwOqjdcp9EK4GPaaB/M6VOWypbbQfsaYxLvGhpnQmmK///vMftRdZz7E5ercMo
	7b/yNpo1z5Xlp1bt41FG6svp2WluysCXr6L7dL3wsK4iEq6gp6F9pIt68Bn/+A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FOjyrO2r;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782731348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Meef8qNImpDHUFJ5L/HsHQVGu/aE8D0eYWBfpqirRHE=;
	b=FOjyrO2r63m8uFNJQuRuS6OpasekekNV4mW9jxbt06LW6ZAaeySIhWqfVR3lbdtqSKhPWc
	AVUAyY3wX65SmujqwDcSpMG4UuX6y6sWMBvsBymCWzlJ5iJXN2DOf9rYC/951oXf/EHljY
	/FOn2eGa8ShR1vmtZdkIUYixNK1IVd40D/Z9Exip6bkhQP9CAykCoBPih2sWOlswAo4UIF
	pW5iF7chViVMPYW7inBr5MG1HjBbGM1l5c/QiHdElsWC59gWBDCWq6ti89v8QwErC4R6rX
	5FqyqWc+SlsRrr6/RaFopOExp0rzR36vFFFL0hEEAMRcwblfMFmznhXgKQ2CQQ==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2] Documentation: admin-guide: fix brackets and translation issue
Date: Mon, 29 Jun 2026 13:08:13 +0200
Message-ID: <20260629110812.69420-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: j58bo89rhnaf9tj8pf9ywq3xmb763oih
X-MBO-RS-ID: fff32459a65cb7c1feb
X-Rspamd-Queue-Id: 4gpk7B0m8hz9tsv

Add missing ']' and replace 'neuer Name' with 'new Name'.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
->[v2]
  Fixed one-line summary
---
 Documentation/admin-guide/kernel-parameters.txt | 6 +++---
 Documentation/admin-guide/media/bttv.rst        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 00375193bd26..17363d525ae3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6414,9 +6414,9 @@ Kernel parameters
 	reboot=		[KNL]
 			Format (x86 or x86_64):
 				[w[arm] | c[old] | h[ard] | s[oft] | g[pio]] | d[efault] \
-				[[,]s[mp]#### \
+				[[,]s[mp]####] \
 				[[,]b[ios] | a[cpi] | k[bd] | t[riple] | e[fi] | p[ci]] \
-				[[,]f[orce]
+				[[,]f[orce]]
 			Where reboot_mode is one of warm (soft) or cold (hard) or gpio
 					(prefix with 'panic_' to set mode for panic
 					reboot only),
@@ -6917,7 +6917,7 @@ Kernel parameters
 			apic=verbose is specified.
 			Example: apic=debug show_lapic=all
 
-	slab_debug[=options[,slabs][;[options[,slabs]]...]	[MM]
+	slab_debug[=options[,slabs][;[options[,slabs]]...]]	[MM]
 			Enabling slab_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
 			slab_debug can create guard zones around objects and
diff --git a/Documentation/admin-guide/media/bttv.rst b/Documentation/admin-guide/media/bttv.rst
index 58cbaf6df694..78c3e560b806 100644
--- a/Documentation/admin-guide/media/bttv.rst
+++ b/Documentation/admin-guide/media/bttv.rst
@@ -1239,7 +1239,7 @@ Models:
 - Galaxis DVB Card C CI
 - Galaxis DVB Card S
 - Galaxis DVB Card C
-- Galaxis plug.in S [neuer Name: Galaxis DVB Card S CI
+- Galaxis plug.in S [new Name: Galaxis DVB Card S CI]
 
 Hauppauge
 ~~~~~~~~~
-- 
2.54.0

