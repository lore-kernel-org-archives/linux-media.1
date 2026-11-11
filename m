Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360444;
	b=XJn49SNZauXkQ0XGGX73PCSpOdedDfbHEdm+NxoBx64cMd7KfR+4Dex+wH8AH2pKlFhP
	 r/ER6c5bZJk/Ynr/j+qhaMsuHM5Pyr9QITZmeeFnsyDeprobkkEbZC+GJtGU7Egk9gpx8
	 ZRrCC86i3aHAMxVYBMoBWdu0RALbsUBPijXxoGpiO50HMn0UAt7WLOVjP0AmWX7MX9NJd
	 E9UTNQOViEFBjPnAV7l5OAdAsbL2viJK1agsShOB9OESqZUHQkpcp0NQEqTzJ/jymKQgH
	 FE0j46JYB6Si3hJ8oPgsO1ZOfPRkQwNpr/C+ekP/Vf1RNrR/2hNDsyYNoz2svpnQ2pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
	b=J1fJ0wYr3OLa+tKlt3VZwa34lJ2zOXyO7sFdEWR/MPZ3JbiRSRipjYkUhEvOM1PNTRJy
	 IfzSqlm+7B23CwZL4MtaaE6RQk14XoO6sVH5+joh31qQrivh1YQl9IVSOQtCOiHIiTt8T
	 0vXBU/HJPdQ2gKIajLTHpLbqnQwlc4YmFk09+9r2SqF2+NWZ/K0MIBintZU6CXjW3orcM
	 hChuUhhmLLsqPTCFV7ad5kB2rDmfc0IvcvfvuPTo+5G0jCGcju9/hZkozcHjb60L3wAAK
	 5S4ArTu220bw50G3LyDJHpGjY3WO1ZrV6KT5T0OuNTPBaQMWVrTilTV3bMZT7fWtekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63D606A325
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 01:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB63D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f6295304dso3518255eec.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 17:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360443; x=1794965243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
        b=Wlr3pYN4X+6KWRM84YdpbLwHgPqEd+AUuok2T5F0HLIOiu0AC2sYIQjID+y+E2fz+B
         onIhLG9YwShoL7jPS4KUVVIU/q8AK6pM7iI6z1Fbx8lmDXets29Pda01dvEfR9ZhCTNC
         Cp2UAGpfzm3BkQ9AUSDmu7FuqXEXdFOEZmnO+ScsHYS9iE1GZHZSXDct8a3GoziXAaNN
         odXiPl6nLTDcmc4WDWkunQaFvNW8YnbmOeY/tK03drlk8yY09kfdEYCBuysz6j7gx4AA
         YI7r2VgTxRLOaVTuzi0uYo5yvEYXUl3F7ikqxa6UumS8kNPa9nX5YoGEqjMPvTaodFtN
         kMaQ==
X-Forwarded-Encrypted: i=1; AL+hErGXa9Lv/JSsph3/vfCNj+hZtKeyLAM8fCoCRzhi4XtgedRhO4o3JW5s1GgFn5L2gzz8A2b1fDI1XwmLrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/oxlN1eK/+0ysXOH2owfOWkt33+bOhppnizR01CjwMwfu8YR11
	yW3YlxiEIxQdYqOHyCp3hsLLW0gkM1Z7GvjDFCTpFWFy95jdvvsrY3Af
X-Gm-Gg: AYBFou1VrPsa2oVSnswpWShpYHDRZRNuOASSPqijY/v9p8vBZnwooeekaxSBlThpOpi
	wyAPHZ1m/B84ced3s02kDVlh33w0t1mib8ghJbPJk4X6C/c4CzalSn6T3IOLzwry4QOTZLmyJsm
	mDNAMJUr1nL7W9xXUxyjpIEBxfjeIBBzgc+Y0JaAmdXSCl40i0xaT6bd3FOZWLCRRk6HbJpAO9T
	w0ZLmRd2hFvv0kSMY+t7BhPkfY/vb3MqQwkDmk9qWL7kCR1ESixO0fOwFvo/r3g5LuZX+UxHrUm
	M2X4vsknau7DYqBMxndGUUeyykQZw41TMIOeZlW32mAPULwQWcT99c3IU5u0rlkeQSenuvO71wa
	z19ElbUe+gaAD3Z5RYocLBFgJqaPBBp59L2qVfnsfuMdKTV7kHl+Ou3Accv3YrqEGGhefFhtHHH
	9Baeia4OXHg1RVN0jOIcLSzqY1zA38yUHnXXIpAx6I7feCZxtVW7CXTcjbwESdFjQuwrFL1RlpU
	rpgNyV6RVVeFU5ziQQW+tg757Y/dPxKh16RET/9LiPPZhiHCw53JGvR82h+Lg9WpFv/yezEGyJh
	uRa2zzicPP2ZpFxhUAURaND+v2kMbPENc3FIUldedp+GAF76+EhwJUBC4uDVK26zl6z3mCV4
X-Received: by 2002:a05:693c:8219:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3768385dee6mr1611656eec.5.1794360442766;
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm16548467eec.22.2026.11.10.17.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Message-ID: <9988b8c2-547e-405a-9c76-a4e6a59c7dbb@andrewgigena.dev>
Date: Wed, 11 Nov 2026 01:27:15 +0000
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
Subject: Re: [PATCH v3 5/7] media: qcom: camss: Add support for SM8150
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
 <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> Drop csiphy_res_sm8150[], and pull this:
>
> * https://lore.kernel.org/all/20261026224957.1115370-4-vz@kernel.org/

Done in v4: csiphy_res_sm8150[] is gone and sm8150_resources.csiphy_res
is NULL, so SM8150 goes through the PHY-API path and clocks, regulators,
registers and interrupts are owned by the dedicated CSI2 PHY driver.

I folded your change into this patch instead of carrying it as a
separate commit, and credited you with

  Co-developed-by: Vladimir Zapolskiy <vz@kernel.org>
  Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

ahead of my own Signed-off-by, plus a line in the changelog saying the
fallback comes from your patch. If you would rather have it as a
separate commit, or want the attribution worded differently, tell me and
I will adjust before resending. I am not enterely sure if this is the
correct way to cherry-pick commits since this is my first kernel contribution.


Best regards,
Andrew
