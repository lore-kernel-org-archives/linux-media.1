Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A7384233;
	Thu, 30 Jul 2026 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785441737; cv=none; b=izUrtxJnUJrtEO1yy6MHcVI8pDHxQW77j+6jsxMQLiviBHhBT480xrpQdmlTf8Zb0Y0b/TVj5YK9x19GuEldbmW8orKM9ru/xUvwYZfILs/8fnMYqK0COYdO6y2J4vqN3GTE2TUXTi1y2ySx0cObyYlbHAqbyIOHzCPD6mAnyCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785441737; c=relaxed/simple;
	bh=I51RoSRfeXhodzhyviCxLakDKoPcWPa9FFUlmYygh3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDHyJyS7cq4OUzweefUeWCFkl9PzJJQMKjr+85+z+9S4r1kxCnvVYFC4SsYGUI6pqToE5ctCsprBSfWG1J4jKdZEn9eIfm/BIZXkH9q16PTXP/l7ontGvpH57Y9jUq1fUky7x06+vMMfCs2h4zvC92aAZOPHm1wIv/DiDXiHmvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENpU42UX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENpU42UX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC0A1F00A3A;
	Thu, 30 Jul 2026 20:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785441735;
	bh=81ixOIIxQDz8Y1YeZwzSahmddmhY7vX/kxMbcDdS2JA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ENpU42UX/QrHwxkd6mwSnu8qWCjuwEcDTYM68/aC3cM+m1BFOn4gDNf0aIE9USj+n
	 6GZp+HK+9ijicRGqFXMKnwH5w3hdtHmVfMu5fxXBsuGbrwiR7EmSJIwmWpWUPrHadu
	 F5iXEFIXlzMA/SP09gsqFseJENjMpsfweRqLkK13RRCRDvxQxlD+zO1/TUH8XbSb1o
	 VKKNnn8nwrKH+3uOK4oBz70LlBXjT5GmAm4kernsvDl5woH60mdHxje9qe0ognGWMT
	 A9h81x70TiRrcCcajy4CLnUpXlR3aW3gQmF7Zyw37lkuRK06paT/QYGNWU4PAzye5i
	 FLwXQMNad7wjA==
Message-ID: <d8137a89-5fe5-4a06-b3e8-be55e59327ca@kernel.org>
Date: Thu, 30 Jul 2026 21:02:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <9bYftv7DVgZ5cXat1TpH-BGbGGNNRGxKT_mLPEzuMzdy73ZM4aqjhRoTTCXkfT13oEiH4T2RepfvnMA11hWBGw==@protonmail.internalid>
 <20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/07/2026 16:20, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> Loading and generation detection are split into two steps.
> iris_load_firmware() applies the priority above and returns the loaded
> image together with a candidate descriptor. iris_detect_firmware() then
> runs only after qcom_mdt_load() has succeeded and publishes the chosen
> descriptor, so the driver commits to a HFI generation only for an image
> that has actually been loaded.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the candidate descriptor is only a
> default: iris_detect_firmware() inspects the loaded image to pick the
> generation, before authentication. It scans the memory populated by
> qcom_mdt_load() rather than the request_firmware() blob, so that a split
> .mdt image, whose version string lives in the .bNN data segments and not
> in the ELF headers, is classified correctly. The firmware is classified
> as Gen2 if the QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
