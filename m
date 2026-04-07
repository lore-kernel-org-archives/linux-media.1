Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE843A3E7B;
	Tue,  7 Apr 2026 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549049; cv=none; b=gES5fF5eeL8hCGiCjNOBcgSVtIfSSYHfeHr4KhyBrlKTlOpMhTS670L1N3vzW82uIrbRBOGa7ABFQ1u95H1czy1WdMBrng4Fd1LSmej/Z6mj60DHtiopdbptP7OUH2S1wZzmDYyyJioIVP0DfBuKP75vJH9r7ZO7bophKd3uJss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549049; c=relaxed/simple;
	bh=e03XGAle/eVycpn3gM3R8Pwurq83UH6v/CkIFozz1/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8rhkH03qzPPxjWI8nGdv3nrjrpW+CVzaOkDrjeCFkkxLhoi8oJHooOrQJNV/IfZg1q5dQ56JftrMQW86G30wMUJd2CICH2p+4ZhmiMGeDzGkyVmIKrMJF1qWY4XsCjHeNOkNshyNOAnprO20w82IexOtvb/t4QJDBfVzDfPXiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OU/mkJwN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OU/mkJwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030E5C116C6;
	Tue,  7 Apr 2026 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775549048;
	bh=e03XGAle/eVycpn3gM3R8Pwurq83UH6v/CkIFozz1/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OU/mkJwNXfxxvGzVeq7vO1EsXwqMFe1jkj4rKCH4zwoyB+tBaKHrLwgE7rAMp7bpJ
	 jrLCuED+PdSz8PdZTvk3hmMVTNEFLbGCCN91OsIbSEh2IzO73pZ8MQRsaZcWqV0Avt
	 UGnnQwIKWrzyNn9omXJFifwv2emyWaOlu1vq+PS6v/1FnB1j5ZYITcF+Kus5n2F1UA
	 0cIZAZ44id2pRhnWThhmR3Ea8znD+Ms0wdY6JxkK3VL3R2KqKIoJFs8kevnJtJQIHr
	 wpwahhCZ6POHIq+Zgu3EywUt2W6UfIP5RtC6VAOI9VrnTR0axrIIvppyb7UqdgxGTG
	 Kfe5xUKjct/lg==
Date: Tue, 7 Apr 2026 10:04:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,milos-iris: Add Milos video
 codec
Message-ID: <20260407-mamba-of-algebraic-wealth-8928cc@quoll>
References: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
 <20260406-milos-iris-v1-1-17ed0167ba6f@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406-milos-iris-v1-1-17ed0167ba6f@pm.me>

On Mon, Apr 06, 2026 at 10:19:34AM +0000, Alexander Koskovich wrote:
> Add binding for Qualcomm Milos Iris video codec.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../devicetree/bindings/media/qcom,milos-iris.yaml | 166 +++++++++++++++++++++
>  1 file changed, 166 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

