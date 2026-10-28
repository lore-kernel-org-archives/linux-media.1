Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189878;
	b=4lZgX4tk4qMcceM2bvZp6L5k52B5VrxO4F3IPA22dYtzuEbX9afV/qIKYKJfjv9qZs3v
	 2h7UqLr/VHhEYBjXY0WPYN9/h3Z2bMSFvtof5YnZ8FDP86bHCOdFI55r147/aJGNXrJLQ
	 oqvTMJ2Zx3ssXNlRmSW753a14mJBGkgPm+/kXX44FlU3ve8wg8n3WRCaa96jn0VRshEKQ
	 0iLtFhi6ggRBNeRjN4XjkiqSfX+JQIZCleJy2MzT7XznyIcYGCnZ+7ePwB0X7qRdJ3NPR
	 491mG2A2gP2NwnflsnUBXejor3AC+pcMfoa9W1cN0dPVCt6PFI0GkrtE/woN6XofHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189878;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=6J9Uh0hoxB/gNf641kzWbidAFl+WxrL7aoy5ugqaa8Q=;
	b=qKQMnwRhz+VQkLeOH8Xlf7E5XgkYO5qfmlWCIy0TFtbFoDVNir/x1TQVGdxjd/2wizqZ
	 snIxsitiseC/RGb2Ukc2hnr54s2Yzb05qQSRLx7gJb1EDiq20s+06LR+yPaAbPZGe1dl4
	 yWWN1p8IH923nKcCjZD2S18rARQ2VvdW7GOPgoIgAfHZRdWYRBqvXJFeN8AU2rHxtLdLD
	 I4d5I4+0rpSO9wsiQ1vy1RHMnYpLCj5jBDvqNbTH5irGggyZD8unY5zw7AKZ8Uc3AelF4
	 yDM7wqdwCdFSom7RAwMWCQBf00O6HI0+je6tjS27cCECCpG73BqqM7EUPLWP8sjaj6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxsw.ie;
	spf=pass smtp.mailfrom=nxsw.ie;
	dkim=pass header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=kev13gsE;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078D606A31F;
	Wed, 28 Oct 2026 12:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E078D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=kev13gsE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1793189873; x=1793449073;
	bh=6J9Uh0hoxB/gNf641kzWbidAFl+WxrL7aoy5ugqaa8Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kev13gsEjsiAANnn9k4xFyEOJBkjr3qA5fwKcZ6CUWWOkhxgSjoGVySNILhl9g6a0
	 xsZzreHTtD+M2gLlqtiwcQ5Mn/tN59fo+XP6wd0r3WZ/9VOysOXuJfT2T+r/c7nMwL
	 7b3PgsB1ZSe0Vln/6T6akOLZlLlmyIiDeBXECnuBRlqq1f913Tl/mCI60VcEDYlj08
	 RjRCeu6uYcEC8cFbTKMIe0CB7tc0VSjLezx+ak27mDZkwN5fyqOruPi9Z4bxkVQLW/
	 XzZE9VVO9bC9bh1UmumqpbUBXI544pSbFVtL2217uWk96SxpgCin8olCClMwBoGMSj
	 BjDYcyuj9q8Eg==
Date: Wed, 28 Oct 2026 12:17:46 +0000
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
Message-ID: <5d886ac3-4baf-49c7-a703-7cb737ef48da@nxsw.ie>
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: f155534f5168fee2d99aa0a8bcd32c788bea221f
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
Content-Transfer-Encoding: quoted-printable

On 28/10/2026 09:29, Qianhui Xu wrote:
> This series adds camera capture support for the Qualcomm SM8750 SoC
> (camera subsystem block with three full and two lite CSIDs, six CSIPHY,
> three full and two lite VFEs and three CSITPGs).  It was developed on a
> Lenovo TB322FC (Y700 Gen4 tablet) and both of its sensors (rear s5kjns,
> front gc08a8) capture at full resolution and 30 fps with it, through
> libcamera.

8750 is on-list for a while.

https://lore.kernel.org/all/20251126-add-support-for-camss-on-sm8750-v1-0-6=
46fee2eb720@oss.qualcomm.com

Could you have a try of that and then any additional changes you propose=20
base on top ?

---
bod

