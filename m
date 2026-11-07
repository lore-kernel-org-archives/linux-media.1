Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022775;
	b=f2fczCVKT9aF5fQ51AtIOUtwE7jck6/cLPuLFffcXpkGn0l46g8l8Q2Qn6plmULUnXio
	 Ilqr9yS2naKqfhPRC3g7x6f+h890ttbxXqgiY60KvF7ujTB9jT3rqDZ3uUPyRcmsbNCE2
	 QYMlMZ7WsfOJpi5iPF/oOki9IT87BkXjb1m9hqXjf6R8ljcDmd1vmG2Psi6rWhi7yAzLN
	 mknWwxFowrT+Sgv4MFfeouO8ycQMgWDyxAu1pBp28bdXpRtSEHDTSN+RfjLwWWzD3x084
	 Z3dylWufRwfHXTuqds9oJJp+Fduyn1RI2lP5yd22ZjoMGzzXBoDxF9qNQwV0MBKKp2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sde4rWYPzlk+BjvGEtm/0bEjWk4rqiDVQzGqAxbKKl8=;
	b=Lax6mot66T8+Q2bjU+B62K0tsA3A2xNnsDf2D9x2ZuLfYLVBaAVYjotn46Ka/1IugpA1
	 sPSl2Vpe1061gIbFx+bDzyzipHnUNWKNgWvJb2p0O4ko70q9Q+B4B9QbECO+7XK5xVQuW
	 dX8s5M4Qu/laCQdXlsOiLP6iE9nW5KVBsTO/cNsm8iMjat/HQv2+wzubI5fxkcTjtPBSs
	 18DxLAfhmw5GfcPaQE+LwsDjGW7I2X/qHlZVNxhOewMpLA1qfJPEmDYr9N+uSs9Fh7cdl
	 5e6oXKeoV4e9xwViTZ/7jGPT0Gqio0nTIbycGBw0wJQHMd4rFJnyKegCwZPVtFRCe5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvtMkzgz;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94921606A32D
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 03:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94921606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvtMkzgz
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3712b6d9843so42697eec.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 19:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794022775; x=1794627575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sde4rWYPzlk+BjvGEtm/0bEjWk4rqiDVQzGqAxbKKl8=;
        b=DvtMkzgzjLMcaDQoyNjMQKjUQqxyzlLBiQUkoif9cFrK4HXhCvPfUWH4F4+h+8f5HW
         +NYmIIMExeqOloneuyGJPB53Xjg+3mlvtFzXNhw+1Mhg/Ay/fE8H1TazVpzMYFLmGp8U
         IoOIkP6qV4Mybf2IeOVuYOXhvi2F7j4ej16WFry6WxxSRSOCo68sMiZIstPgpuYCh0Mj
         J4NuXpfR2jhLFwL09bkvkL/gW76a+/8SP7X9ysVqq/y+2J509YDGFZZ6x/BQGQ+sauim
         l5/Aatx7kFufP396rJ3KVLrv5uwLI9zyY7c/NMYY8oTc/QDMUreCN/46UrKltJeyzqP1
         tgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022775; x=1794627575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sde4rWYPzlk+BjvGEtm/0bEjWk4rqiDVQzGqAxbKKl8=;
        b=dZ7OFoAYsZ5J5Hudcq4YAN6k8SX2vIQBSExpPRWRddcYwWTEeRCpJYR8ftpfftpCLK
         NjhYvX7tUw7QXpY5BoFwvixbwV4MavyXQjhWjvMUdfueFvkqomTZSBlZDWqxrDZ8yA2a
         KTE/KmeVKrMV11uqA257oHNd+JOR5kIVC8HAzi/ihi7RqXO/kVnuoEkYJl3cK1UuKfHG
         JaJMW6xhZWdJVruFLKgGpxp+ct37lF5mLMcG66ttM2bz/mZqIDLQUigY7Qwb8SNr4uMi
         fup89Iak+ySiNMJrIDHv3PQAGWDamwPK+PadM+i7yXNVhtixd7fCS3WD2VXOtHnHy0xu
         n83Q==
X-Gm-Message-State: APuU4Z/IRPUeqqjejkn52XU9vwB94t2lPpps3qc65CVDS7+wJ5lAj21d
	Zh1hWiLpjYd5YaguTrobfqpiRz+VODQ8gl5WnSi4514YdK/I1bprfuxc
X-Gm-Gg: AYBFou3fTVYsW5EuhO5bA+yrOSWUbaDojt6x5TUP6Oo8vqZMaohthIgrYS20iryRa7D
	1BXeA9Rw78QiizIQ1odPntc+ilVT9P8OEpz32sMege+ArIrNJXqqRFrJp36gaOmLWcZ+foqYsQ/
	8k0mX5B6KATr3CwVr97AkBMHUvvXM364wH02vymo3yXaGR3deQ54BkLGKSdfnw8/vka9HYYBuVv
	XXUWwwshswUm5By7Eid7Ky0KbVQ2cC11OUHDSL4EpBUDNQ8vZg2E59ZTnb84L2hgsYzIbphnYU0
	pLBrPUf7/YTYyGBIuK9BdKw7XhhjiQtmy+HWQ7eo/LUf0hPH27Ke/it7sBKd209jYOfG2kZMh+W
	4JlFSS6/1I96Y6SkmSXa1JMqGfZPFrf8+1ylmN7vI6wqH3vxm05vH4ycJ4bbik+Le98C79uVxNV
	L8XTrmGoH7uTa1jXgLexI3iJbIuQhtFErP7oC9e8rE8TF5jBXR6emmnGRLL6dM/1pdikK6OM0Nx
	cK/7i7E6haqRTj42MlkFpJtmlkbXTtF6/n7ysCvf8yK3d4DEUXE8f3C48Zi59d5a5NlHv+CYYjK
	SJ1/QOEVrsJpzuXY2ooxSscO6yykz8EO31jZljT1eoKnkrI2b0LYI5wuZ+Y=
X-Received: by 2002:a05:7300:10c:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-36f7710a6e3mr5903376eec.38.1794022774554;
        Fri, 06 Nov 2026 19:39:34 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:e335:1852:72d2:7bdd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm13790821eec.10.2026.11.06.19.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 19:39:33 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	alx@kernel.org,
	shlomojune6@gmail.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v4] media: siano: Replace strlcat() with scnprintf() in sms_ir_init()
Date: Fri,  6 Nov 2026 19:39:28 -0800
Message-ID: <20261107033928.13891-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for removing the deprecated strlcat() API[1], replace
the strscpy() and strlcat() calls with a single bounded scnprintf()
call to construct the IR device path.

This preserves the original NUL-terminated output, including partial
or omitted "/ir0" suffixes when the 32-byte buffer is too small.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
Changes in v4:
- Replace seq_buf with scnprintf(), as suggested by David Laight
  and Kees Cook.
- Remove the unused seq_buf include and local variable.

Changes in v3:
- Replace snprintf() with seq_buf operations after reproducing
  the GCC -Wformat-truncation warning noted by David Laight.
- Drop the previous Reviewed-by tags due to the implementation change.

Changes in v2:
- No code changes.
- Remove the statement about buffer capacities from the commit message.
- Add Reviewed-by tags from Alejandro Colomar and Shihuang Liu.

 drivers/media/common/siano/smsir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 283770d583d5..6952871c5816 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
 		 "SMS IR (%s)", sms_get_board(board_id)->name);
 
-	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
-	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
+	scnprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
+		  "%s/ir0", coredev->devpath);
 
 	dev->device_name = coredev->ir.name;
 	dev->input_phys = coredev->ir.phys;
-- 
2.43.0

