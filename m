Received: from mail-m21469.qiye.163.com (mail-m21469.qiye.163.com [117.135.214.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B544C4FF
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304381; cv=none; b=L7MJUCTO4jO4IzrU1RdP4WuKgvElZl7AHjeQ+5DP1zxPIEPlXFlvAYkz3K+S1FMah7vMB/rWSzX9Dqo7ZHG9UbJoL7ss9ZPJsycd82ewUful777jOYrFF56fKZcc61BB6gg5SRjz6qKhHwagqNXQrKW8EPYJ3AmSzHGIJy/2xCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304381; c=relaxed/simple;
	bh=QJpgEnO0Uol5hLs/KmicHsY7QmQXn+83WP4SIE9+uBE=;
	h=Content-Type:Message-ID:To:Cc:Subject:MIME-Version:From:Date; b=gu2Og33UjVmiX8TIck3Ua25GeCM4g7IS7dzMBXP7W3Lc5wRqCXS1ejlrS3EoINg+nYXzl7lTYGG5Grop2Ym9rBG+7WtEasSTjcNtkqrq2BtuU0q7+DsiWfVM3AjkEG/fi2bC5ejMk61sbJkXCm7S+0nZ8JPcb3vf3YzrryjlfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn; spf=pass smtp.mailfrom=hdu.edu.cn; dkim=pass (1024-bit key) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.b=hs1b0AEB; arc=none smtp.client-ip=117.135.214.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.b="hs1b0AEB"
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AOoATABxKyooWcIuKar*D4rn.1.1787304053109.Hmail.242270054@hdu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, security@kernel.org
Subject: =?UTF-8?B?U3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gbWVkaWE6IHNhYTcxMzQtYWxzYTogYXZvaWQgSVJRIGhhbmRsaW5nIGJlZm9yZSBjYXB0dXJlIGlzIHByZXBhcmVk?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 242270054@hdu.edu.cn( [183.129.147.45] ) by ajax-webmail ( [127.0.0.1] ) ; Fri, 21 Aug 2026 17:20:53 +0800 (GMT+08:00)
From: =?UTF-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Date: Fri, 21 Aug 2026 17:20:53 +0800 (GMT+08:00)
X-HM-Tid: 0aa0239ed41bd45akusy8b5c73226a06
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEofVh1IShkdQxoeGhgfS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSklCVUpPTFVPTllXWRYaDxIVHRRZQVlPS0hVSk
	tISkxDSlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=hs1b0AEBYgfh9BkTrPnSrmuq/JEIJE8hlRDJ1DV3AuJQkNhXWJ2LOOM1mIglOLa39hOHIrbBHfQm03Dlf6IFeLzQKWFMkLyi+t8JN4yQ8SzL4kNuIGWHUhSudcxPa47Fka6+cP68kjXg2ahEbf4hPfsjaKDLDRq57prBh2obFPs=; c=relaxed/relaxed; s=default; d=hdu.edu.cn; v=1;
	bh=QJpgEnO0Uol5hLs/KmicHsY7QmQXn+83WP4SIE9+uBE=;
	h=date:mime-version:subject:message-id:from;

CkhlbGxvIEdyZWcsCgpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgoKSSBhcG9sb2dp
emUgZm9yIHByZXZpb3VzbHkgYXNraW5nIHRoZSBtYWludGFpbmVycyBhYm91dCBDVkUgYXNzaWdu
bWVudAp0aHJvdWdoIHRoZSB3cm9uZyBjaGFubmVsLgoKSSByZXZpZXdlZCB0aGUgb3JpZ2luYWwg
dGVzdCBzZXR1cC4gVGhlIHNhYTcxMzQgZHJpdmVyIHNvdXJjZSBvbiB0aGUKY3Jhc2hpbmcgcGF0
aCB3YXMgbm90IG1vZGlmaWVkLiBUaGUgdXNlcnNwYWNlIHByb2dyYW0gaXNzdWVkIHZhbGlkIFY0
TDIKb3BlcmF0aW9ucywgaW5jbHVkaW5nIFZJRElPQ19SRVFCVUZTLCBWSURJT0NfUVVFUllCVUYs
IFZJRElPQ19RQlVGLApWSURJT0NfU1RSRUFNT04sIFZJRElPQ19EUUJVRiwgYW5kIFZJRElPQ19T
VFJFQU1PRkYuCgpUaGUgcmVwcm9kdWNlciBkb2VzIG5vdCByZXF1aXJlIHJvb3QgcHJpdmlsZWdl
cyBvciBhIHBoeXNpY2FsIHNhYTcxMzQKY2FyZC4gSXQgcnVucyBpbiBRRU1VLCB3aGVyZSB0aGUg
c2FhNzEzNCBkZXZpY2UgaXMgZW11bGF0ZWQgYnkgdGhlIFNGUApkZXZpY2UgbW9kZWwuIFRoZSBu
b3JtYWwgc2FhNzEzNCBhbmQgc2FhNzEzNF9hbHNhIG1vZHVsZXMgYXJlIGxvYWRlZCwKYW5kIHRo
ZSBjcmFzaCBpcyB0cmlnZ2VyZWQgdGhyb3VnaCBub3JtYWwgdXNlcnNwYWNlIFY0TDIgaW9jdGwo
KSBjYWxscy4KClRoZSBkcml2ZXIgc3VibWl0cyBhIERNQSByZXF1ZXN0LCBhZnRlciB3aGljaCB0
aGUgZW11bGF0ZWQgZGV2aWNlIG1vZGVsCmF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVzIHRoZSBjb3Jy
ZXNwb25kaW5nIERNQS1yZWxhdGVkIGludGVycnVwdC4gVGhlCnJlbGV2YW50IHRlc3Qgb3V0cHV0
IGluY2x1ZGVkOgoKwqAgSU5GTzpUcmlnZ2VyIElSUSBhZnRlciBzZXR0aW5nIERNQQrCoCBrY292
LXJlbW90ZS1icmlkZ2U6IGFzeW5jIGVudHJ5CgpUaHVzLCBhbiB1bnByaXZpbGVnZWQgdXNlciBj
YW4gdHJpZ2dlciB0aGUgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHRocm91Z2gKbm9ybWFsIFY0
TDIgb3BlcmF0aW9ucyBpbiB0aGUgUUVNVSBzYWE3MTM0IGVtdWxhdGlvbiBlbnZpcm9ubWVudC4g
SSBoYXZlCm5vdCBzZXBhcmF0ZWx5IHZlcmlmaWVkIHdoZXRoZXIgdGhlIHNhbWUgaW50ZXJydXB0
IG9yZGVyaW5nIGNhbiBvY2N1ciBvbiBhCnBoeXNpY2FsIHNhYTcxMzQgY2FyZC4KClRoZSBjcmFz
aCBpdHNlbGYgaXMgY29uZmlybWVkIGJ5IHRoZSBmb2xsb3dpbmcgcGF0aDoKCsKgIHNhYTcxMzRf
aXJxKCkKwqAgwqAgLT4gc2FhNzEzNF9hbHNhX2lycSgpCsKgIMKgIC0+IHNhYTcxMzRfaXJxX2Fs
c2FfZG9uZSgpCsKgIMKgIC0+IHNuZF9wY21fc3RvcF94cnVuKE5VTEwpCgpUaGUgY3Jhc2ggbG9n
IHNob3dzIFJESSA9PSAwIGluIHNuZF9wY21fc3RvcF94cnVuKCksIGZvbGxvd2VkIGJ5IGEgS0FT
QU4KTlVMTC1wb2ludGVyIHJlcG9ydCBhbmQgYSBmYXRhbCBleGNlcHRpb24gaW4gaW50ZXJydXB0
IGNvbnRleHQuCgpSZWdhcmRzLAoKWXVoYW5nIFBhbgpwYW55dWhhbmdAaGR1LmVkdS5jbg==
