Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8656D32695D;
	Tue, 17 Feb 2026 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324665; cv=none; b=JgeetHpW7md53MAsL6i6qjG/0rp9p4/jLcm983o9fIfQ0q+C5/Y/PWKm2frLOlwX1ehLqMtab9Ox4Uo8RjQOELfRlxy8Wrvpt3VwEfSaHWxnQ2b+8qytSI/wYuJNJzBQJ3M3EB7RfzZQp3JkeBGxasQRZvAr60i2oGAsjluCmCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324665; c=relaxed/simple;
	bh=lQJA91caIzTutmlDhlay+0TovoxvUYi7SxVgx7da/pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWTmE7Rw9J18P7u9Hmk2YfeaOoNaJJa5PZ3trNGjn/r7OTVeY6hkSK93fYMer31SxYfzfXExT29OSmmAMnYWnnkpPndzgcET4BI4Y6HRYwMfkzZRPqZT0nU8apRLJHKQNENzirr5G8iiSYRk2sn3xVQ//sqR4GrRDU9qhyrAw1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkK3qFhx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkK3qFhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE94C4CEF7;
	Tue, 17 Feb 2026 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771324665;
	bh=lQJA91caIzTutmlDhlay+0TovoxvUYi7SxVgx7da/pQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YkK3qFhxiCdDHCIGOkK9J1d+35hRnDu7EUsES327QY4a5X5q4PAwtbjC+eHq/SgBv
	 NEYyPWzyLTEQ8tG6FC+eSXxpPPfzAW3Zx3HATW0quqN4we2jQrAsP3/O4SF3FfjekF
	 N13R4r+QOpeelDIZy4ROqIEyG+D3JYNR9ZGVtimcPnDOCYURg1nRQ0+MDGlW0uNNOs
	 5H5uCDODMs4ir09vKY3o/RWHdWl7WGLRVHqQwF7KDU9kePUroCOqGBMqcdh/5I59F8
	 8u8QJBlUApw1FeHTsIp2M0FEPWUToRoqXGCFV1njFTEwOI0snTuhDQVKrujxHy/+hI
	 HL7MX3DNB1UkA==
Message-ID: <36e636d9-befb-40fd-b63c-6ae48df61199@kernel.org>
Date: Tue, 17 Feb 2026 10:37:38 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <mnqt1vydHJ7duvh6qPmtIczPjjPtvVtq45CYhLhlpdAIKfAXuZDtVvIZD2SN2d2m7oF1f75HTXuXFO7qS4ahxw==@protonmail.internalid>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/02/2026 07:40, Dikshita Agarwal wrote:
> Due to these constraints, I think, the only possible way is to extract the
> version from the firmware binary blob itself.

According to the internet machine

MDT::SW_ID
      GEN1 == 0x0b || 0x0c
      GEN2 == 0x24 (or above one assumes)

If you can verify that with the Iris firmware people we should be able 
to parse that data out of the mdt header and reliably differentiate on it.

---
bod
