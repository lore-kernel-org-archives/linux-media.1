Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75931F99C
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434674; cv=none; b=awz1PesMLNNFwxcH4utf54y9QsqfFBkIssbqXRP73aFGjAqkrXAkNj2nbYCR0P3uyAnarHrEIuiALv1vj6hzikYeqX5CGtG191KmsoHahaeSCbPsUKH80m2ZXsArp2mk05zNfFNpsK+PqTYDlgKRud6cuRg2JiNC2Uzdu/yG5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434674; c=relaxed/simple;
	bh=RthSqZf0DDbfE7GqRv1mD8ZLsDt8tj3LzD0j2X4Sgvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnuRwD46+di1mh9dmLflEAV6iimckXC5OWYDemEuXSPx16dDM1yB/9aI5uEaqclwUkUsuWiDMrOcwHfGpM9rOsgBB3dAgyNTdlYbTtvXziz7cGE2eoKk24Xm+QI7jtvkHRotSPlIXV3Sb5ObbJO6hLzxXv/0B6BARZ5aO/wVATs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LysJkkJN; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LysJkkJN"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93a0bf264a4so238973985a.1
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 18:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434672; x=1790039472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAKtLNOJWbVnxDBkVZ/0uqO6Tw1qnmXMwpf6IStwoh8=;
        b=LysJkkJNlkYwqiziNwoslfoDXK/moa35vApFMWIqPdqVi7IiIkkutg5OcdbvSY0JQZ
         2bNAvnesA0ERR+wGRAsExxXfTxge2Uk1DaFEdk7zLuKKTs8rvVNhJ1ES2rep1gTMRYWq
         RpDLRxmPlF11WbAkJ4iti39CI0VO1R6zabulvlNfkln72XdQWiiFuDn3pGXo9NUTxfQR
         BtV1kdVb8tIYa2LAmw/PFQNtrpNag94RjBh+DQDUXSfI+839fwnWV/8slcrYXgG7umuo
         KHPlmSnEBt7S1X3P4EXkSdV9Hg54I/WiddIUqHvKTWe/dbCq9BdIB481cr/jv8Tuuswb
         RaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434672; x=1790039472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAKtLNOJWbVnxDBkVZ/0uqO6Tw1qnmXMwpf6IStwoh8=;
        b=daEAWMjTPt6fMYQgR9Ri/ViJYgnUpQ8uX+QpXNVnWA+H+1hR49Ia6CrprIMn84DUcp
         yTmZinJOuEIfU++j+pLiqRmDxTpQAcBEsVwIwslD+Z7n5gCYNQwMEaiudLTdzgSRQTSk
         grklFoqgtFJAPjC9Mn4+0CDYLZlYz94p09e2mxmdsggLYjelCeB9uorcrzMh7bLy9tMQ
         FofC/vuxNqIGX0YYfmiihfylTaPLpaz6DfRf7mKiZ3iQuNnaX9GNQ06mTtohxZgXjK+4
         8rFQ6mSuiR6pm0ZYU5Vod5TaUOqFWmcov+tax6hgUQKqXlObhRU+g5QYSCOMjnF4tzRQ
         cwBA==
X-Gm-Message-State: AFuF++kUNicLeJGy/O1DsFeIVgaktQylMpqL8rdtkepXvVBrRXtF8m0w
	GKNZnTPxVu90Oinc+N+pSa0inCNDP4djNCvsrUg7jJYyKd05/o7PKew=
X-Gm-Gg: AYBFou07+yZTLMDV5JSq3CUuRr5gZK1bCDkxVVxT1WuJZbVC51EDjXRGaebj9b62Ouc
	saiQRtptQtRshYz7bs4jLHcVby7q4QXYPz3ufAN9NxDwJzesKEOwCr41oz6RbqSNg8m8P2VaQsd
	P1fZN7H3bAPMNmLKQEwseJkG122DIXzl5rHu+SSMg1wlsRcbLsUzFmivatPUh7tmGzp8mTMQSh8
	M+39H3gV7VV+uEQGOpKz2fI5tFSey/1kWfPsiZoGl0drZ3lZbU6p/935gl/DXUB20qeBWqLCT0Z
	RaYwUIkLDPBkOijAVssaXQ4I8gwoNLo0v3ZFYpEHtKxkyv3NUra0c7qgq7/N4FEOR0Fg+NUh8aY
	wqWla4aUVBd9LzYJe4bTy/2VucWB3P9lLQp1KudX+Y63IQMlMexcvL99U5Xn1+zpRglzdOQqxbW
	Bii7i8oqUmRz1WOXnZumVymbCI2GhDcLSIGKXyUnXve4jbie63Cvnvrk80/4MFCkvZY+cXrfzzL
	LaFsskLRvrrckYazZHpEaXrfcaJOKgywEEYIkXRrVu+UIPYKvDusUelDxGwz515aKgwxqtxBBCG
	P64C2sD+9CbTC9fBSB0l/RZC81KnEZOorgA5SUVQKiM446EmJrt78soAsfqXnEMKDAm3ZD0=
X-Received: by 2002:a05:620a:4555:b0:93a:2e8:5afa with SMTP id af79cd13be357-93a29939a68mr737739085a.30.1789434672383;
        Mon, 14 Sep 2026 18:11:12 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e809fd0bsm1118996885a.33.2026.09.14.18.11.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:11:11 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: tw68: balance PCI enable on cleanup
Date: Mon, 14 Sep 2026 21:11:05 -0400
Message-ID: <20260915011105.56149-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tw68_initdev() leaves the PCI device enabled after a later probe failure
or tw68_finidev(). Use pcim_enable_device() to balance the enable reference
when the driver is detached or probe fails.

The managed disable runs after the managed IRQ has been released.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: e15d1c12c587 ("[media] tw68: refactor and cleanup the tw68 driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/pci/tw68/tw68-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -228,7 +228,7 @@
 
 	/* pci init */
 	dev->pci = pci_dev;
-	if (pci_enable_device(pci_dev)) {
+	if (pcim_enable_device(pci_dev)) {
 		err = -EIO;
 		goto fail1;
 	}
