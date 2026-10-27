Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142258;
	b=Ct8Fq8XrMcSrH+D0wVscvK5Hent+YSPB/CZmD5xv17IWM+U/Ct8AVSeJIO9JZzG19kqp
	 LQaZLuUCxR2TfIzAzY2/oWiQX7/bgcypkZ4KZPlrM3vYvfifhiCSM7ZomEvjfzp+w4Qjl
	 CefPjxeoqUp2O2TZsYL9Ob7Ajr+gDJ+PzP/uc1K1XfhPn89TxjYJY11vHyHZZGfXLnABO
	 xUVEV+PuoEl0QKWH+hnrW+DAgsgV+J5SMTMA6h0om750C+NeCIvv4PhzjkmE20PBvcKsi
	 Ma2IHAZg1ZY1X50xuWnBAvtskNKLCpF3cRxmNW8xDvAqc4Cu4UzCCsR9KUvnZL4vTCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142258;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=l6x15Wu2xqhb4s+tX0nrK2VMpWKabQTnaaG0C/TwTEg=;
	b=0CyLVnNRxVSMx6YZHrk182Ef7fQS9k6OWQAfeH2i1TdJxCXqNAPVFf2WWpxU9eqBx6cC
	 Bz8qy9mV10/n6fAcChFOdXcMOYsPu4casOpBlXuhjNmaV3SybU28kC6yRCvZSQqnGIV6I
	 8qrWy9MYwyHl1ltWBMocAlbaQ3dWQRNcZpHQ+fg8ywM1/BiLHp4nZkDq5on7yDsq5hyS9
	 +HpgT9M0lnqej3WSXhJ7PLewKK2mAVCs8M8iIRSp2cXh2kV1ydlaH638TKwGF94rGWciL
	 xADdxFXIrMeaIU+O993g8U9HDse+wvKfi9MEW/L5inwYoQoxUDmGAdv42jvr/Ay2upg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDIIlQib;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BBF606A31A;
	Tue, 27 Oct 2026 23:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDIIlQib
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C981F01825;
	Tue, 27 Oct 2026 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793142258;
	bh=l6x15Wu2xqhb4s+tX0nrK2VMpWKabQTnaaG0C/TwTEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SDIIlQibi7VyGE+plNK6Ru2/wP/issqqXEMoVgT2cHxIpyiPvZ0GuJBfGZjlz+tMa
	 Y88MEIxjOaM+NhGTDHp3hFYiK5pufHYw24TJUCC7NWgH/BDqNVyJYjGs58R1ZqzYG+
	 LAbxdpRLHWF3EugzfVu+FWZdY37KjsNNiqpMFhvbZJmIHBggjlRJOHBZjbxWdyX/u/
	 dnYNCZzs/EQ/HhHq9Vkpl0WhAU874KsqLUQFZ6ZxVowOfj4VD0Hj2h2y1/jhRK+M8N
	 afkUrQ08XQivzT9AbTGSjWEBK7YbGcdz6PW5L7RNbhUi6U1mXFyFkNejDLMRBLJeXi
	 j7KNG9Hz9nv2g==
Message-ID: <7a75607d-dbb9-4632-9c82-66e409b4ae65@kernel.org>
Date: Wed, 28 Oct 2026 00:04:15 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] media: iris: Resume the first source change if it
 fits the CAPTURE setup
To: Christian Cortner <ccortner@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Birk Skyum <birk.skyum@pm.me>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
 <27ldWnKGBafN5ETxI1j-rJ89F5fUzvpMFVEUWqA-KGVU0Hz2ewALhMf_QAsSW1LyoNZyndhxdCebvOD2Zo_0rQ==@protonmail.internalid>
 <20261027021934.22113-6-ccortner@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261027021934.22113-6-ccortner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 03:19, Christian Cortner wrote:
> Not for merging, and not working for most streams: this resumes the
> firmware through iris_vdec_start_cmd() while the driver's internal
> buffers are still sized for four frame buffers, so streams that need
> more (x264 at its default settings needs six) end in "session error
> received 0x4000003: fatal error". See the cover letter and
> https://lore.kernel.org/linux- 
> media/179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com/

Right I was about to say this seems like _alot_ of code to be sending 
back to -stable

"Not working for most streams" - fair enough thanks for sharing all the 
same.

---
bod
