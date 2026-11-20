Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202699;
	b=Th/Ka3w9bJaOqtjMQHQsor99ztQVN3ucqM7VQjMWQBiF9f6rZ2n1PQHWdAkrxp32sfnZ
	 u6926rBv2XstHjFhRnZK6DcWzGBTbEdmIDKeF/wZFdnrzowx+BV/qPLDoJGrcD2hdKkxt
	 U7xQzvRDE+inbmxuA9ZH0O3r4+eEmuaWdQw9NTNigaYqM8PGqrQ6caDqJ2Zp6r6beGPWQ
	 jvmolMcynRJdTXAxFKIejp3AYB+nbbvEWY8n6yk+oE9TD8Df7bTJKLNH3SfLOfoFpfNOB
	 JbL6Q6X4iNXIZW4uEaIo5kl2QGX27gJ3NIW1IULZ3zujGrlLRzvasvuAOAmCWcQ3g+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
	b=0Z7ZdLEQC8YPYOiWTjjCuAjAgVUwDNPq0KyTmReFBuILhM1VrGyXwE3XNpt8BTNP4Cs9
	 OMEpEcNbKXdSq8gTP8Y9l5zxjLanZMdsQDVA9BYLNpV0QVs4AAkDtp2AIcNQ0aTjOytnd
	 YsNEnpoDbMuTUDKv+vo6DltwZep3/BmwwGYoJI2q+roocTmiIdGH8QRokCbuOIUukn9IP
	 AZE+J3aJmfBpf1hogV9yU7ZkyJ+tvr47ZV8OOcmqtf1YU+4XLt+optYE3JL9tTVB7+Xkz
	 zuwSyFcZc1Tt06wvEB879Akydl8KbwSQ3w+OJiWs/AHb+1Hqb/Se1mq3o/EFUU0Y/Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MVQEkLVA;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F889606A336
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F889606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MVQEkLVA
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso3834342eec.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202687; x=1795807487; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
        b=MVQEkLVASWzcLctXvL7AYtV7m61aTNFb1XD+C73MtdPXsPbfveVmK9PYVGoB94QN0e
         USSioJInTnHaM+vpQnrbiL9BPZuKzCE/+b9T7Pjg2Dahq/raakDfk2kUiaTlV8ShfG08
         8Rh+GUhK0eS+yiAoG1sd+Jf7JwRY6G4pGNOa6Ly0QKtaxbK/1SmRlyb48VLbM7KCvLCT
         FQjjhbqq1M/+2OQA9tB9G53AbTbYMjmyDLwyQmE84UyY3V2yPtqc5CBAu6uvVtvDoTFr
         U+O/E1z/1kMBFXwjCsC8Ei1P3gmd558P3nu4W5oR3jEEHCT64RbOnkhhdkur9zF0/Zxw
         mxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202687; x=1795807487;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/fv2Bmd9wBtLji1WNEQDEdz1uwjcCB1ddxM9BJCZv8=;
        b=fw1IpbApUIp1BZnwqSuwHZCi1Ovb75b8S0mx3ycliDZKQ2WEP0t2jPhsbOQchl2HBJ
         INne9D8VvpC0YMB5+pmDIrMNSV0mq0yWwb1nC35R72kmOD4iBB1BpP3iTqWkQaPXoe+7
         BZ9r/D3SnLdrAXmd3ztDi+MrtnVNjSkTrdS91xzN8CXKhvghheALhTQyCbzVGMlsEFPz
         nTqebG5N+0q6hdQbzhj9IiaA5SQy2rEA5HMZjG8yui6g6Yug+z9ZnhKhv8THSaWLqTfQ
         EJhn1HMHT3e5WVj0NazCPkinMpegq9m+fvD9b3GtkHyMF5hafI3mGbprJLWgnoZ1TlLB
         Cfdw==
X-Gm-Message-State: APuU4Z8Q9IjxwTHZEit9wuVdwGD8UAUHywJMSxK2/rcwbQ4lKNG32MRA
	Ixj055/VmYC9Oi6bcQn3UTP0nROB6en7ZPCTCE/Z6X3h9pWw3W7k9soMEzrYdBCQEqqKqfp4l6C
	eHg==
X-Received: from dyx8.prod.google.com ([2002:a05:693c:8208:b0:36c:a092:ca28])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ce11:b0:384:fe97:8ccc
 with SMTP id 5a478bee46e88-3856fb58443mr4028219eec.29.1795202686267; Fri, 20
 Nov 2026 11:24:46 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:32 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192432.2873409-1-elkin@google.com>
Subject: [PATCH] media: amlogic: c3-mipi-csi2: clear csi->src_pad on error in enable_streams()
From: Elkin Cruz <elkin@google.com>
To: Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When media_pad_remote_pad_unique() fails in c3_mipi_csi_enable_streams(),
csi->src_pad is left holding an ERR_PTR() value. Subsequent calls such
as c3_mipi_csi_disable_streams() can then dereference the poisoned
struct member.

Reset csi->src_pad to NULL before returning -EPIPE.

Fixes: b63ef604a28d ("media: platform: Add C3 MIPI CSI-2 driver")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index b5e59e810e13..c261daef15b3 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -426,6 +426,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
 	csi->src_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(csi->src_pad)) {
 		dev_dbg(csi->dev, "Failed to get source pad for MIPI CSI-2\n");
+		csi->src_pad = NULL;
 		return -EPIPE;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

