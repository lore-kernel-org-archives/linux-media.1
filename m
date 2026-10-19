Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424819;
	b=3eqmv5ep+YIMAsQnduRaWOUz3+5j0ufVgj9pzjbG4FU99+c3iW6zFT7g0IpyZcPyKLog
	 4av9OsItU14yUTTyGM3gfkHUAN4j08np7pxC3dyReP+k8VNOnMiJRXu5IivCLt6wq9w9P
	 197QBZgDmBxLeZLr+JQuGYVuF4sPF59imuUUi4rmB5fVJrjI8FacjPYlmxbfBzR0wzsod
	 5qEfDnkKrAiRsE7U9VIvnFD8iqBWu66vb7NgSweSGcSA8qhR522zWQ0rR0yISdoeahlRH
	 vl54cwIJL2dtuZx9xB1mT50TIDgj+BwsYi2zDqK4S+VAT6UYnW0szYCk+qyWs7zywgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424819;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=d/Gac34Omv/+u8QbZNv+NEeAcxnQ0aUxCTFCqoUCVzk=;
	b=Rq3YLAzFot/anGPYJn2ozxHk8Xw7cWNn9wefxX4aMIvrllAbRo51EYcmAU6kFkHKon2q
	 5dDTAXwSy1MmFt/gbijoQQfiQwFqKomQp8WkBHFBcJfovmHyMm/3r9+UZ3akBL2ZhhCdG
	 jsPJs6zQ3kUoB4hCPJXBpGqUDE7312z2ddq//XC3heoWVBxTN4FPtBDcqt2V8TOheqWl9
	 XELnturSZdHtuGs5M1C22nElD3sHCHA509F6WnQGpHazGQOSAYG4+6wGsAriNGS0OoMVI
	 eC2Adf/K+hIb1XWmPceMY0aRkd2H3dVUGrIb/I2l9NwBE0RuoCin90xVRGS0/OlDg7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=r9mPaLpS;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=gHBEBDRR;
	arc=none smtp.remote-ip=23.251.234.56
Received: from e234-56.smtp-out.ap-northeast-1.amazonses.com (e234-56.smtp-out.ap-northeast-1.amazonses.com [23.251.234.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F26078866
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 15:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367F26078866
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=r9mPaLpS;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=gHBEBDRR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1792424817;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=d/Gac34Omv/+u8QbZNv+NEeAcxnQ0aUxCTFCqoUCVzk=;
	b=r9mPaLpSZYIj/X3vDwO5fc4gDF+VMEdhRdD7HIkSyVd0lXdA/V1bvghe69cvkJED
	UFLGT5qv3ql8cw6GReMMzr3Y3WMwavdqOOmD3RYz9OPM1q4Mp02t5KAvsxtPXUMus7i
	A3XcDHncWVfFzCo5JS2j1hMxBnl4THLg4VoPN52U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1792424817;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=d/Gac34Omv/+u8QbZNv+NEeAcxnQ0aUxCTFCqoUCVzk=;
	b=gHBEBDRRjTOwMUxXPDbbe1GaLo1Gy7wPkiWTejhdC1BLzLdjcuteGxcD5D8EhfFT
	iaSdRzH7ec8/U8jLE0IFYbSP5z449STWd10jN6x2LcAD0ZDS3m/EYNC6LPdIxPgAWpP
	AATbI/t0nHEa7habuwZgyTRERPHHho0rVDq6y974=
In-Reply-To: <6acec924.a3c0497f.3c6821.f539@mx.google.com>
References: <6acec924.a3c0497f.3c6821.f539@mx.google.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: linux-media@vger.kernel.org
Cc: benjamin.mugnier@foss.st.com, sakari.ailus@linux.intel.com, 
	media-ci@linuxtv.org
Subject: Re: [v3,0/2] media: i2c: vd55g1: preserve stream errors and always
  attempt stop
Message-ID: <010601a154d8304d-23013904-6e45-4685-b817-64ca61c2441f-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Oct 2026 15:46:56 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.19-23.251.234.56

Hi,

Thanks Benjamin for reviewing both patches.

The reported failures are caused by the collected review trailers being
spelled "Reviewed-By:". With the standard spelling, both patches pass
checkpatch with no errors or warnings:

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Could this spelling be used when applying the series? No code changes
are needed for this CI report.

Best regards,
Jizhou Tong
