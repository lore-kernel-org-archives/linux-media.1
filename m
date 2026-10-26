Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009135;
	b=qCQnAmRwuM19+pDn3T5ypId5iVZgTR2Zh4cx+2TvwuiteATj3kcLZbgP4CzfWHFiTQPF
	 exlWLa54aswW/M1x9Rrul1MEovzj43iI69l/wPsDXyYAtICHOFXGJMxP1UeIe0vt6/x+y
	 Wi1ptDilZk0N91vxKqNYLKCAhLOLwAJ0SV9iFGq1hwBIcpY6x8sDEpXQPxbT3Rhfg+F+p
	 NJ20p3WjkHJIagj74EHm62b8eEbdeoMxgenorab/G163D2LwT5PXE8vhdJ/cb/eWwKBGC
	 G5jJybiubtyQvOifNphN1aoQKsa7yWn5wgngWVcT9WdJicnpS7Cyeg/itxnul8hJtiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009135;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v3NFjaWHJ7bvY/XjUsWqfVhJKdXmtOe9orl9OG18QrE=;
	b=FOeEuo8xvLcyfMdkbC90x7F9WfNvsLDC3dIUJzrK7LS0i6SelRHWRitTOcjoZSwRiONe
	 2A/tUEy0agALusu/10LYgyZ83DsC5dlzTNYTi5GlHzDrdYnoMApIMVH6ashDZ2Zmv0iKZ
	 W/Hkugh/dxo3R9dvdfWAVgfs77iSpcoGEb4GVJ5BLNTRhQ6NIwlSkp5g8kvRHAAP2YZfx
	 XWg60bOSsNmB0c3WyVbN6DORYE8iaQvLvA6fCvIvam/IA/YJ6qIy3TxCIcyOWEpQCBOTV
	 AmLcFDoXgA8Dk7fmEkoJbe8yCbqQ52L9PRwis5zKuke3Mz8AdsZbSUYiw/SF0NZadlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JNUmY/f1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD360A380C;
	Mon, 26 Oct 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNUmY/f1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231101F01280;
	Mon, 26 Oct 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793009134;
	bh=v3NFjaWHJ7bvY/XjUsWqfVhJKdXmtOe9orl9OG18QrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JNUmY/f1bWpfjbH9LtqVnLBAlIdmMwk6N0DcxVqbLTL2BtepF/2tBpP4UX+lGhgAD
	 5msOx7ZpM68mrWl0skdAip46EVF3ulm3nKhPMeKQw6TJV7SCaDzTDbp+1Gs5zx6nRY
	 AXhGZbhQLbhQRN0wc0fGHLJzCiDdl/rcrEfOKihGDQ+LIYrxeLDyfW+6JCWmZBeoVU
	 +EQRhTt7MRXWkjOChsNF+KpewRw3pCTHTV1GtrnqVw6vCKeBYmBxbwDbqb1uI98x+T
	 Czz1zpBVZTh5Ng4aWDUFSEXpsfw/fq3sim7FmujJtt9mHNyD5o0EH4iroxGbpSNc9u
	 NT2FVNhke6CBw==
Date: Mon, 26 Oct 2026 11:05:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm8450: Add CSI2 PHY device tree
 nodes
Message-ID: <20261026-zippy-diligent-curassow-448dfe@quoll>
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-3-vz@kernel.org>
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
Content-Disposition: inline
In-Reply-To: <20261023163057.775917-3-vz@kernel.org>

On Fri, Oct 23, 2026 at 07:30:52PM +0300, Vladimir Zapolskiy wrote:
> Add device tree nodes of six CAMSS CSIPHYs found on Qualcomm Waipio SoC,
> and a shared CSIPHY OPP table for them.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 280 +++++++++++++++++++++++++++
>  1 file changed, 280 insertions(+)

Ordering of these patches feels completely random. DTS is between
bindings, before another DTS, before drivers.

Best regards,
Krzysztof

