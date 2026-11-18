Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995608;
	b=WdPxSSADmuL3aY40URmBCXOY3ntWPVjka6cMZtvFULAgt6XzMQqS2Se6oeYgp9GK0fSg
	 ifTHZXrwwIMZF3+ySoXaUuah+j9Ny6x0z53lq/vnQNMMZOsQjYYD04Uc0WQVwn8VpUycV
	 hBwYvkIQylSIME0AHqIk0fLH3NJM9kgR+ZzvaITS67ZxC7V3oPPMJVYs9kKQpbn38BGNA
	 5eLom7BNcxPRK/9hrozKV9lSnj2qKXpgxABEBx8g3hZkdl8k2oX5MPK8gzGD+i3X0+Bjh
	 Sxk5IVCXJmWBdKuSvgt1NVZQurE+HNwsoCml2xWGhGl9QQDUQ8zJPoC/HAhD9LYDyzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
	b=QKl1nOaOe0NkwKP0lGQmrb6kdhOaaAzaFmQNjnpnMrH8ET8SPi4mCnTlrsi1ZReCmRDL
	 A/ZH1Gxvh7erbAI9diGaICzG9xa3jHx6NjAS1tFFwGVEKCHBkpOYeqdVy+Ahj1RgOIsJT
	 Mt0ihfk7MLz6SbYPNmii5OP3jf33Upu8CgzByFeCKPZpqw0xlZSKiyO7by1RlGi0Ln0l8
	 bMsLbgA3FK/F+Uk46xIli7ichSV37Wjq7TlcwJ65+lng+joE+L8tkMmakXXbeBXiPRGga
	 T+aIWrs1P4uYMFMKFUUYGepmH8bYnQwdDSP7XFJY0p6RWaT/8UXgUH3mRVX48N3Gc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETYtVlGz;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23121606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23121606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETYtVlGz
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so1472378eec.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794995607; x=1795600407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
        b=ETYtVlGzePDQfeOeqoTZZfuGGlZosMS8f3cM1m5HOcPoCx/mrFjSOU4DPL7rufXk+j
         Q6qAX+2VKt98xbZNvlNmTpGvgPurqpLelXzEoDH7lPxlR057vug9C84JurPL4+LYafQr
         /sWdL339N3CgtRWSZHd0Cd+X2gNgnzCg+DRuHwhAFSzyk8KAMlNaw3VmfLxUqgo9vszn
         o8YNWjpsp85dcH9lq5AUsyOTa0hvDyW7XGmDhJLVoXZWaSOJO+bjnqJma3LzAmZ/nMqR
         2hnGwLoVWQokIraWgtYI0TT97kchnE4cnXgkyNn3wkEEbJpPsOHlMvae5GOkhn36uez6
         r3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995607; x=1795600407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
        b=MvJveGjVZH043X1rYSJkydeWROV7ovXnDm90YAkUTs3+O2i9tIajAsYPpm73AFddnq
         tcI0ig2285D4rWnUuwVwL5MzRTpqC5gksKfUr9vk+sa2ogEasNer4+NKDntA5/a5oX4P
         VMTE5h9h6pUo8cKYjyLjn7WMmUOKB87hmwWxlD1F8iWeMUzQE4oPOnbn6IoFf0UVwSAX
         vSlndLE9Y15MknJ1X5xqSmdAg5mwmwHIV0l9OmNlt4zFrhUe6kZ8GeZ1lEtetnwEjvfF
         mGdQDbVW1D35i26mcmjMYkALpPUH9cINbxUgAZFQOYM+gp0U4oMZ9bPJCc2q2GaU9+op
         H6IQ==
X-Forwarded-Encrypted: i=1; AL+hErEt4LEaUq7E0du3ACmFLM9klYEfCvCVTbG/CtccB71oZvHn52c56a47Jq5Zhd7uHwMtL2ZowtqJHvZO+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z83KtswwmxwUOF3tFOnMP9hmmO5lpcr+Zgyl8Xq5+hGRi7oA/I6
	14UpNNq0DgLEsznINZqIaBvXO63VcLEMzJug6+V37oe/mBVu24Ve5f9f
X-Gm-Gg: AZFdTZe8fLD7ba5VdzT8ipmItXxmlg9WB5nrQKSN2GniEwlHfFrfi3QPl+5ByueWYOX
	t6XdOK32Qus8AHjp5R0g2YaxUj/HiK6+fLBN9cUfOZUEOgM9pDiAjCE6PJl1EZE1rzhQNvthKrh
	Q0kYLSoc3omr+NlLyETiUXq+Dkcf/mGYc53eF23aTVUjAbd+BW23ZQu0fK8jIDRi6RWXZ/h4qf/
	z3kYiNDsl/Ji3A9ITdQhkVDsxnDVdOfH4RyjmrAaXcmAPxo4nSoPZoNNX0DXk+lmY9Rn7WVz5he
	MhJp7vOhQ7V9AW8fR8MiYWmxD8IFe+sT80C1GXipOQqlNgUirBm6bdFy7UTtOcE5j9vlV/jB86k
	9+kkDqY6NZyFKvzXPRegIRHGUDh9YWUBo9zp42gro7vJIuxqnYi0f40T8BH5W3nLcfuh4Zop44u
	0EFn7MxPZRW4xyEyH+70BVgQkb4I5FpohkdNnBWeSKVp7wfQYimLPmfvoBy6rYXwGlmySUaRNPt
	a531gMHMAYQD4iKUP+n+LSyAuR0ZXR6+4weUz8s+7V8Ax8UzumGxWyb0EtZG4/J1DKztuGYwmcW
	C3pX27xqHlf8gd3GSMuuCVYeXSu84LZgw4Q+r3LhGyfqE9LMk4WUmn9JgpJnIX1M5Otb5Qk8UTo
	gul6FYR2zUgsutbrre/+apVy/xkRPN5ecI6HnA5xkhHU1NtfM
X-Received: by 2002:a05:7301:fc84:b0:370:1e50:a485 with SMTP id 5a478bee46e88-3828190e7d4mr1883449eec.37.1794995606974;
        Wed, 18 Nov 2026 01:53:26 -0800 (PST)
Received: from localhost.localdomain ([103.107.26.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm6800826eec.24.2026.11.18.01.53.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:53:26 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging: media: atomisp: Deduplicate and reformat atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
Date: Wed, 18 Nov 2026 15:23:14 +0530
Message-ID: <20261118095314.42769-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

atomisp_subdev.h contains duplicate declarations of
atomisp_find_in_fmt_conv_by_atomisp_in_fmt() under ISP2400 and ISP2401
comments. Both declare the exact same function with broken formatting
(lines ending with open parenthesis, leading spaces, and awkward line
breaks).

Furthermore, the definition in atomisp_subdev.c uses the same broken
formatting with leading spaces and a line ending with an open
parenthesis.

Remove the duplicate declaration in atomisp_subdev.h, place the return
type on its own line, and shorten the parameter name to 'fmt' so that the
prototype and definition adhere to the 80-character line limit and
Linux coding style.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  6 +++---
 drivers/staging/media/atomisp/pci/atomisp_subdev.h | 10 ++--------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index bdd2d9b18..6af8a42a6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -95,13 +95,13 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 	return NULL;
 }
 
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt)
+const struct atomisp_in_fmt_conv *
+atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(atomisp_in_fmt_conv) - 1; i++)
-		if (atomisp_in_fmt_conv[i].atomisp_in_fmt == atomisp_in_fmt)
+		if (atomisp_in_fmt_conv[i].atomisp_in_fmt == fmt)
 			return atomisp_in_fmt_conv + i;
 
 	return NULL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be..c4a3bce6f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -300,14 +300,8 @@ u32 atomisp_subdev_uncompressed_code(u32 code);
 bool atomisp_subdev_is_compressed(u32 code);
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code);
 
-/* ISP2400 */
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt);
-
-/* ISP2401 */
-const struct atomisp_in_fmt_conv
-*atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format
-	atomisp_in_fmt);
+const struct atomisp_in_fmt_conv *
+atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt);
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
 bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
-- 
2.50.1 (Apple Git-155)

