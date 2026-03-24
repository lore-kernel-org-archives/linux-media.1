Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AEB3DA7DC;
	Tue, 24 Mar 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348240; cv=none; b=Ag7Cd9F143dWGSc+6jTPZ8jh7EXYJ4Sw1CKGMbPboRq+99RmJQquQYq4wDnh6J4v/gXWUhxzhbO3ANyJq1KQP2DW5/0RcvFkqyHsNGw/vtGkjUp7TUOF9UNabwT+EDb1sxZ44Jz78kl2ijnvzup8AX4ODb8jk6n/yujUR2WX208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348240; c=relaxed/simple;
	bh=EM1ywzxihDD0wy5BqsncuUARwEpnZv1Vw+KYvhKTU94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmmjQKh2hVI3I64MUFon9V8v+nBbiYynPjubTfs/SZaBZZQikbt9x8o0KW3SRVIW2JhNGcbUsRzVQN6fCnvNGHzznFF7DmGHeYIIKFVL+0O2q7sYKtvFqNS6r3bMEk+ian2tVlZsQjVzzwH5av0ErbYwEzvFY7MqHVM9rPTYGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npd9drjL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npd9drjL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE05C19424;
	Tue, 24 Mar 2026 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774348239;
	bh=EM1ywzxihDD0wy5BqsncuUARwEpnZv1Vw+KYvhKTU94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npd9drjLO81Kqu6VQ8bm4wnnWgqYKkNa2RQ26bvpq+VnrdSFBiM5siM6uNo5A5QSP
	 0ClC3d4L15pPAXOwNuV5Kf/ncI1toYFmTecf9vdYgXFyWkdz0ue/AMC5a+1v7TrtMo
	 cMFPJYXOnemKit0tMLyjLOYMzpjoda8+2v4F4+MDueRXn2A1cu6eA908OxU+dRRrNv
	 fVcKDNi6QR4zmjJSB6TiBJIKOigvZNuGeRuGrf/Z7QKN2dx99r+04uw0Wx/64HziZH
	 PYaoIwehUC+RPGeaEa65Cvb6iaUjgDGcgID4tzQDBr93VtcY3V6JwAO/3pIB3rf/6j
	 Sf/FpQexZOkLQ==
Message-ID: <f5b189db-b481-4f71-a118-607808742658@kernel.org>
Date: Tue, 24 Mar 2026 10:30:34 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, vladimir.zapolskiy@linaro.org,
 laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johannes.goede@oss.qualcomm.com, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
 <TePvvgDVDb_k2QvKDX81eBWL8NGBfBgyF-Io4NhyhIFdXZPUV2lnWOs2t2DlDb_3bOLmk-QnfJsRA-dG6Ey0cg==@protonmail.internalid>
 <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
 <34038c03-5416-487c-9b61-f37494247ea0@kernel.org>
 <FPOMHBrPnBX9HXkomCjnjQF97axu2Y2xT80Kq2cobTRzLi627qVeiKzOD-J2OmubjB5plZDaihAvZ_X6es8Ggw==@protonmail.internalid>
 <9648c51d-983d-4841-a3ba-bf6246a87817@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <9648c51d-983d-4841-a3ba-bf6246a87817@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/2026 16:15, Krzysztof Kozlowski wrote:
>> ope@5c42400 isp@ is already used.
> Where? dtc would warn you on that.
> 
> Best regards,
> Krzysztof

Oh.

It _should_ be isp@ its camss@ apparently.

---
bod
