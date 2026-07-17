Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629F3750CF;
	Fri, 17 Jul 2026 03:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258628; cv=none; b=ai4dspmeJ+wZFflxcsRMLWFebEmzymjS9IGtSamLkbvti2KIJFN1N2+5cyDuGoVdw/7PhbLN6NHLuS4jglvrMWpOAkBVIweK9mk1VkGCrhdyOCWjDBKZ+MxQCvKX4Xio2AN4bKMfqX8LUoAmrGzeybrEKR2XvH8ojQ9kioMYebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258628; c=relaxed/simple;
	bh=WPm0mbEs1OtI5CyXDyZFz3qqvGoNUX4xEsEof9QmFA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIyiCRko+88aYTuILWPV8TLbN1GAHlT+T4NDkeQRqyes/z2jrOeMn5plDtTBzD+x2Rxgu5cSi7EgRtyQDv+sgL6xuSsiyAcjxqGZX5Tw+kEe//9XB8G1j00ickrv6Is3/v7X4DvyPf+pspRECz6D3t2t2v2Z9jrQmLOP3IdBnOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7e8cVqq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7e8cVqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648071F000E9;
	Fri, 17 Jul 2026 03:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784258622;
	bh=Jg7ilhqfLbJ/BbdPC2qKW9mLJmW2XY4evCJmiXdrwWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m7e8cVqqOQJjTtxGdPPsVObwkKZwScKhijFOzakppZAWUh4lc7ZbdeKhS+dD4xqJk
	 kwS6BXj8t7vHXyz3pgEY35N/A1EE9Euiu4nEwBOHbDADOoVzfPQbGSSLoJ618Fw07r
	 VXBvkCK/++74eyY8yPcSZgOr3plRjurtsWq3gupujTCEoRNTdPJDI8QXCYlxtOeWkA
	 89VHr0WVSEamTHM2wm36z/U92REziOIz08+yLeihEe3MHaexOl24uszVtDT/mx7V7E
	 CZBmE5b7LB5ACvO4zDNz/11tFKji+BhW0fQZM3acnsJuDMWRFAdMW/zJA+TGowtB63
	 yGi67r870YHEw==
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/2] media: iris: add support for purwa platform
Date: Thu, 16 Jul 2026 22:23:29 -0500
Message-ID: <178425854597.1084804.12425956841748083386.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
References: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jul 2026 18:17:25 +0800, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: purwa: Override Iris clocks and operating points
      commit: 43899c55d79baef54652ec3310683da304706fd5
[2/2] arm64: dts: qcom: purwa-iot-som: enable video
      commit: b66ca23dd964f78eb9ed0207ed0909fd9e8c27e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
