Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313661;
	b=HeqqhqM6qhjKxmT8L1tByzDBWLoN43XL7Q9j3HRonAFqWOKm8k3u98p8oC1fAVzUshed
	 lskSIC2v4MmIq0G9N6WbDYmFRTuJ6wDF0GfUrcWl6g/Bo/cMG3tIythYMLbRp/Qr91AJW
	 u7sf2Mv47GClIUFhRs/+yFJDENvTu6L40/FWe28Aabv+/nTcdZsQZeuEVfjx7z9Qba6jn
	 eNbapCkL8vcBHEvDxN+okOH+9gzRSXBw1I6iwBep9PQY6c4/S8ets7Dl5pp7mIWZt+32I
	 M1CEtmMwf0JtEABU+HIntPiiuBmUuMk+RHYNmPzbJVklA1eXgkzdyYS+ID1+jOmnNZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313661;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FNSy+MNbY7zX3/OWP+ciQYN7FCib+mFAaBdW+/MLa+w=;
	b=v3165xGHy2VLPtpAMGQ6kIGU8K2LqvBx0GRD0wvhDD3lOgqrhIGSvPb3d1vhOkJrOcCs
	 Jb0q1eq0N6zh64gYM7WqTgnye48lOwi/cKp491xxmr1DzvXMikcIl5+6cuC1NUkHoMGPt
	 OYAbKa/LPl7Y1LtPFL3Paay4xB1ktC5rx6i3D0+lnvhqriPnCm6ulJfKGXPBYeH7vdFKx
	 BLNPmQsctS1tFXLXjqyMaZX3EECbdZDsONTc7xhn2AprDIUozh6dIsNBIjz9+1WNZ3LrD
	 D67ZRU/xTI57v5jYh5Xcy/ZRG5sBhmRrQpmmZ8RlCGNZtMlIrPFxk4hv2vASZ125xkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GrYje0Cv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9C606A68D;
	Sun, 22 Nov 2026 02:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GrYje0Cv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7940F1F000CF;
	Sun, 22 Nov 2026 02:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795313661;
	bh=FNSy+MNbY7zX3/OWP+ciQYN7FCib+mFAaBdW+/MLa+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GrYje0CvyAy/PkWTnfVWpJhgZOPCLbH8Qxd4XKBG5epPp+KYcSiF86Dh/EgEj75Yw
	 /+6lkXgldr9ILIh7CCX5etmGIWORFMbz1XTns3nNaqKUIlLjLnuw/mmimSgtY17MJl
	 ZsoCRuxbCnjUivFBP40gT8Y/CwXg0IdC3RrGpL2pRIfLOVI0KRswCUfIt3YEp7Mlz/
	 cgvXMzbsfq8Iqp23vvjaBlz+Dj6a8eMp9L2RNqqvkJa/FNkavVD70DLISy9fh3EEob
	 jDzF6H6NP5NB9LPvA3PqmxY8KhfvEcdW/jPrnRxweyenbNZ2bZx4RdBUnYt2k979+R
	 7iBjGI1UN+5nQ==
Message-ID: <bdc56ab4-bdfc-4fca-90e9-d062492d5bb4@kernel.org>
Date: Sun, 22 Nov 2026 02:14:17 +0000
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
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
To: Jesse Casco <jesse.casco@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <bakmRZpOJBjy821YJxah2Nnw1RnqixGp2vZGDvKDtxxYhDb14ZRQ7TqS30tb-Kuqe8DrnzLu6bViyV3Hkueo7g==@protonmail.internalid>
 <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 17:40, Jesse Casco wrote:
> CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
> with the CSID's index through parent_dev_ops, camss_buf_done() is passed
> a CSID index and completes the buffer on the VFE of that index, and
> camss_reg_update() is passed a VFE index and updates the CSID of that
> index.
> 
> That holds as long as a SoC has the same number of full CSIDs and full
> VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
> only two full VFEs:
> 
>    CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
>    VFE:   0, 1, LITE0 (2), LITE1 (3)
> 
> so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
> fails to stream with "Failed to power up pipeline: -22" because there is
> no VFE 4.

That _should_ be the case so in fact having the CSID2 declaration is a 
waste of time/effort - it is dead silicon that can't deliver data to 
user-space.

Better to drop it and tidy up our code. If someone comes up with a real 
use-case for it we can switch it back on and do the surgery to route things.

In the meantime keep it simple.

20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org

I'll take patch #1 from your series and skip this one. Dropping CSID2 is 
IMO the correct path.

bod
