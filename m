Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117269;
	b=ZrekM45kBxawwHpB0QyJDOtKfFgqIDcTWhyMGYV8ZpTflLMQDtZWRqBUh+DXHpEbaJ9E
	 EII4A4UV7UF4wTeVQjCF2wvdKpWxlmHBcG8bh8rU4u5jKI0v1Jks+dz7/aH+iv7Zfz3dw
	 2gLf1HB7WM/1U/689+utef6kEPIfozSUmLder5mR9K/UH2WhoW+mMG2CdcvFvHoaeF4nA
	 udEopH/TNP9rWodDPtSw0kBdTQ0ZjkAmTPZxEPn7V7YyXBg0seo7vQO59z56LsaOZiLHR
	 9ciULnB0JgPXjFWlSpVtrQgR8PY1mzaBa4PC8cib4sVfkEXup3fN0aQAQB9ugM88eGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117269;
	h=DMARC-Filter:DKIM-Signature:X-Mailin-EID:Subject:X-sib-id:Message-Id:
	 Origin-messageId:List-Unsubscribe-Post:List-Unsubscribe:To:Date:Cc:
	 Feedback-ID:From:X-CSA-Complaints:Content-Transfer-Encoding:
	 Mime-Version:X-Mailer:In-Reply-To;
	bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
	b=s5zY2k+iJU00sud+27CobBuY/PYEoOkdVKVtpHLnDmdAfHYmajws6et78LDSmB7CahGu
	 /Kp4bQKKwS2eUpfIzyqfgPZkfkBMur9ZWYET94JtTPwK5VtyZHAGGNpiR9PiePF+idcjm
	 e8eO43fY7Sul4JwtYwPFxI13y5mQ9/urH9Yop+JC1by3kTggDwVFHze5lDESCt22NNnLg
	 +aSWuRCw/DMCMmw+pn6er/XKUoRNDszReJGWcAuxfggTiS4SQLcuCED1qBizq7nIkYJUd
	 xuo9YUu5v2v357ttPdMNQyEmvQapwXikck3VEccqi1xPsRVEDIpVi7qczZvkfcPNmkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gy.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=kuhQb9do;
	arc=none smtp.remote-ip=77.32.148.25
Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D3606A323
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 05:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=kuhQb9do
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=kuhQb9dopMkO/ygEB3mqfLi+PKf/UZ5pZ9L9tXW8GnKrANHbfn4dKiFTEVn1ky4YbD+sRScnD2w4
        IYBxiWaCf57NFoCJDDrxVmGBBrT1YpXSaL87HExOxRqUWDD88tA74+xfWxH2ncoxbIcyB9pJ73Z0
        IuLgKkTwsWEN4YOA4/1el+5PHPiZtYHBRsGSHgG3KY0SFVwzRtw7OUDZJUipOTguToHL1Cd0pc1f
        zG0oXFagjCBAgnSoohAqG4p/hvAsrFJ8JJR5jGlmkzVyTC6KpqwKwhswMW2q+Cg4tSkUA+5MDeb6
        u4/pR/uFx+0hs9kLr6u9aTV8trxdgeH7Glie8g==
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZ348MjAyNjExMDgwNTU0MjEuMzAxNzYyLTEtRGVsYXlTeXN0ZW1AdHVib3QubGF0Pn5neS5kLnNlbmRlci1zaWIuY29t
Subject: Re: [PATCH] staging: media: imx: ic-prp: add FORMAT_TRY frame interval support
X-sib-id: mzULYbl3vc8cPxrjJDSYmW3shF7IFoF1hQGaXY45yI8rLhlvRjuaNCJFTPfAMSeEzKCGgMYwQqCXEh2Ql2uHXLv_9qx7kStXtOvQ7qiWCA3wvqZNKksPMCglO8sw8THYQ7sPOphydHcivhkv-51g1OGTy3iCiyNDnV02VImwF33dGECHpkpBeo-U
Message-Id: <20261108055421.301762-1-DelaySystem@tubot.lat>
Origin-messageId: <20261108055421.301762-1-DelaySystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
To: <slongerbeam@gmail.com>
Date: Sat,  7 Nov 2026 21:54:21 -0800
Cc: "DelaySystem" <delaysystem@tubot.lat>,  <linux-kernel@vger.kernel.org>,  <gregkh@linuxfoundation.org>,  <vickramk.207@gmail.com>,  <linux-staging@lists.linux.dev>,  <linux-media@vger.kernel.org>,  <mchehab@kernel.org>,  <imx@lists.linux.dev>,  <p.zabel@pengutronix.de>
Feedback-ID: 77.32.148.25:11287567_-1:11287567:Sendinblue
From: "DelaySystem" <DelaySystem@tubot.lat>
X-CSA-Complaints: csa-complaints@eco.de
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107-batch1-m1-prp-try-v1-1-56a08f54791b@tubot.lat>


Please disregard this patch.

It was sent from my relay by accident: it copies a patch I did not
write, review, or authorize, so my Signed-off-by on it is not valid,
and I have no connection to the listed author, so I cannot vouch for
this submission in any form.

Apologies for the noise. If the actual author wishes to pursue this,
it should come from them.

DelaySystem

