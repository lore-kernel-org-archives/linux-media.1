Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EED37C91A;
	Sat, 16 May 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778923230; cv=none; b=P7kU4J0eBEad9xQTC6szrjdNiExFwvRwcYtjhPBCCxRIefdP35xCRUesC1mKuMHid6WoILhdjDRdX2c+RXSa2w6XWU+Qg0DK4pgI/5VoSEC8maF0myuZmJACCG98QpMLrhZSpMV1q/HPZdE+hGWjDnlfs9NbUlLtOO6Ek+CsHBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778923230; c=relaxed/simple;
	bh=CY+PEGWTgI7c+cZr77dD9LUfjb62Od4MKi8f6CQRBIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl7ajAB2fkSfWkWyVFwHa6loVwNcSdWQGhNFvtJ758TuCEEf5xpGnXUeKeOdpNhuArhOiXhOytNOlkAnqzIQnOhSnJX0dkDKcgoG+Q19CSPlhApJQFe+hK71/45rDAPxJFNwCEqQD1FVQq35KKw9cSxT+MsdzvkPS1wso/IXe/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7jN//yh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7jN//yh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95D0C19425;
	Sat, 16 May 2026 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778923230;
	bh=CY+PEGWTgI7c+cZr77dD9LUfjb62Od4MKi8f6CQRBIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7jN//yhaMJfaaoRtHPocNPVeK8zBKwpheLCjGPpCRg+qWGLwSPC/hbSYbCd1oQAJ
	 6WJxmnG50/AbcwhrlnL6KC5juLGBTmR8tSYP9BbVSEsun3cjm5cRPraL6moaX7+uS6
	 m1CPNZOJbQlMTaJ9dAeb+N1jzKrDVrrYa00lizV5lJgKLyalpEn2KsDjp2gIkvUqNq
	 907OyCUwQGV+3IJlj5OA4N/ifSEUFD7FV4Sfayaxs8u9O2OXJvITrXovI0cpd82sQH
	 jEJiW2h96IPVWfh14o7Ho7eE2VecEURa2xvu5utrtpS31paypJBWaC3LTXqsjBLOIW
	 9sbl2BGWCRocg==
Date: Sat, 16 May 2026 11:20:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v7 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Message-ID: <20260516-nifty-adept-gharial-dae755@quoll>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
 <20260515-iris-sc8280xp-v7-1-2e21f6db1897@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-iris-sc8280xp-v7-1-2e21f6db1897@oss.qualcomm.com>

On Fri, May 15, 2026 at 01:56:35PM +0300, Dmitry Baryshkov wrote:
> The Iris block on SM8350 and SC8280XP is compatible with the Iris
> (Venus) on SM8250. Describing in the bindings that the block is Iris v2
> and not Venus. Document SM8350 and SC8280XP IP cores, using
> qcom,sm8250-venus as a fallback compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

b4 trailers before each new `b4 prep --edit-cover`.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

