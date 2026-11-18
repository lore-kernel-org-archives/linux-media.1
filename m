Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=151.80.165.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976511;
	b=WQ1MNmHt60g/Sn19y5Vf5EwM9yHDtCnulyo1DTr++0yhKTouCoWcO1rdRxBd5AfT9YPp
	 1gRYPVZTyDoYUzOpd1/EaTiow/0r9KvyFNyQCSp49baRM2FBkwvqNI+gKQmH+d/Ag5VlE
	 zKXIABJXxqJTLe48hPENnL1RSIKi32e03eXR9E5S9QAeF1ePaxDeigrKakF8+qvrN7KQJ
	 Q3Ow7dmZdhDdlsscoKwPwOl/K5HJsY0Gyw5Ph0x3YYGu+FfTI8q80LCImP5qNNfTundTH
	 1Qr6/qQHhz2afsqf6/0TGYK1vZityTLZutlsQosp3T9taQ68Zc835TnJxRbOu29D2hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976511;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Date:From:To:
	 Subject:User-Agent:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Server:X-Rspamd-Action;
	bh=bv9KBCgx82TDLhDCdAxD+EscJLGGBg4WClRR/9yUXaU=;
	b=2VJ2ojQy5tLC3Vu1hTjZdQ7O62ugx+1X1gkH6/ePA3XUDxV6gT1S3+ELTcFscq6YsrCX
	 mbm6siQnkx4ExC/OxR3OKVwWUod2Q2qk9v7ldI//P4758HorVxah94bvaeboWWy299Qf2
	 CryEpusLRxkw7plsnEvSyf17uCXME3K6Pyvqcw+DUiZqDHmqPR6bMeIcik9CfV9qoQE9i
	 kZgMAVBhU2ugIwJjIyE5W4PDwX2xqeufwjkr9O3VLl6HL+Dh9eyI3VuhAPFPDTGSR7Nhz
	 jvUuUw2x4e9M5l01kbNtVbFeoBJDh9ckco4IjEbUPBg0bMzG+O3UC6e8UHuqyoPNlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aosc.io;
	spf=pass smtp.mailfrom=aosc.io;
	dkim=pass header.d=aosc.io header.i=@aosc.io header.a=rsa-sha256 header.s=default header.b=ibYm2MUH;
	arc=none smtp.remote-ip=151.80.165.199
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2B606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 04:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C2B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aosc.io header.i=@aosc.io header.a=rsa-sha256 header.s=default header.b=ibYm2MUH
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 85BAE3E88E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 04:35:03 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.38.223.107])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 14C604006F
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 04:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=default;
	t=1794976501; bh=bv9KBCgx82TDLhDCdAxD+EscJLGGBg4WClRR/9yUXaU=;
	h=Date:From:To:Subject:From;
	b=ibYm2MUHnj0h0V2fwjNG+7ErdsOGKSl2pMXfxBgiI86hBVGRuM1mHXW6zZnhudMDW
	 dwvJsq680TBuy23+S0CcrAYbKWaWcoE+lh4/CwguEg+RpZQLCANAn7O4Da+hPKx6Ad
	 KtlVmSvSh3tBG3HZSDpNH8nT9PsqZLOZP4vp5ptU=
Received: from ehlo.thunderbird.net (unknown [103.172.183.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 74B42E25CE
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 04:34:59 +0000 (UTC)
Date: Wed, 18 Nov 2026 12:34:56 +0800
From: stydxm <stydxm@aosc.io>
To: linux-media@vger.kernel.org
Subject: Anubis challenges blocking file downloads in CI
User-Agent: Thunderbird for Android
Message-ID: <3539F6C5-63E7-44CF-87BE-FE98FE8BD588@aosc.io>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.29 / 10.00];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	R_SPF_ALLOW(-0.10)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276,ipnet:51.38.0.0/16,country:FR];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALIGNED(0.00)[strict];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	TO_DN_NONE(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[aosc.io:+]
X-Rspamd-Queue-Id: 14C604006F
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action

Hi LinuxTV team,

=E2=80=8BOur CI pipeline is failing because downloading files from https:/=
/www=2Elinuxtv=2Eorg/downloads/v4l-utils/ triggers Anubis challenges=2E

=E2=80=8BCould you please adjust the configurations for direct file downlo=
ads via CLI tools such as wget/curl?

=E2=80=8BThanks,
stydxm
