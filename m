Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239E43C061D;
	Tue, 12 May 2026 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617413; cv=none; b=DgiXF/k8bbpcsepLbsoIczCpWwZmtOhkasEsmXcLRYi/JbqHsd19qmldG5mpxtQ+erwwNqkWW6b4qke8VT+QqK8HQAKOs9gNlgzuXaXy6CEvpX/OtSbMu6ExyKHFHCzHqpV58k6npv20bvEP3TP0TjtqVpHnSWOyP3gp3HhcgKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617413; c=relaxed/simple;
	bh=smrhsw5WzxYLyP5GjviwuGAL96+rihH0k141oRv60BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhYqkU2bLKlHuzjyUIGnE/H8hdgo1FccuQSCWMJewzb4hdTiqe7hOqmDHRZBL5f8aEEFIXa7Q0bmEagi+FqEacOTl2dh9SG3RIejn7BvI/GTqIRGT8TsQGqoioVcTjfDxgw67omieD1neO2y4EpQdTwJep3XMmXTpXueMjBZ/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOQkBGWl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOQkBGWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EFDC2BCB0;
	Tue, 12 May 2026 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617412;
	bh=smrhsw5WzxYLyP5GjviwuGAL96+rihH0k141oRv60BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOQkBGWl41IfumLFKVRzZwtEhWFsSwuOl2uMSaTPCtzhH+816Nr+1l+F2J6pmj50X
	 vGIkV5sYqBK+3R5cIplmpVf8xQTnCjhWJYxM4CV7+gepGVyqpc0dX76V7lzi5pxQec
	 PJuuHe6ygIvqFmlwCP7fOkTb62Uc0K4MdABQqzeSpsJ+NNaEF8mWGB1Xmc/5AZ0Ijb
	 hoKiJ0Vt5FmzH1e0stIT5yoJimbuRZY4dlRtipMoVtuLsFWQVsiyEhIFI3K2SvbJF2
	 6WwDSm9J0LOZYRiEU1ApG+hlcC7Yofy5Bf2Go8jziNhE/lSykqEJ9+pBt6DkPjKLZz
	 6+1hrdJqojKFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/16] media: iris: Add AR50LT core support and enable Agatti platform
Date: Tue, 12 May 2026 15:22:44 -0500
Message-ID: <177861739346.1242344.3408282680025332189.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 May 2026 09:42:00 +0300, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> [...]

Applied, thanks!

[16/16] arm64: dts: qcom: agatti: add higher OPP levels
        commit: f8874bc5792134b7bdda9706e2a48e6285da3664

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
