Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F83E2751;
	Thu,  4 Jun 2026 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581896; cv=none; b=Cz52EYSsXsTW4UPsoFiVMFtYDLIWmjVAbXC9L5YsSZ0CE3wxf0+33P2ZNmULcTyN+EuPRymSpWd2nG3twgTkCjPHX63CaFmVujnj5VNIMciC6m/ifeW6ZnXeOCZuwdc/UQBvRvKN3ONTGmfiGlzs98Vp86qTs4284kF9V0sQ4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581896; c=relaxed/simple;
	bh=jyKBIcCT1hxHezZbwB5nqXBtL0MX6wXxR19jVjOssPE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OthwcqrQlj8SrS6imzzV7h+Ve90EbMK8JhvpOytM9p8E8NxsPejebSgS+aGknn1155V08Dz40jkINljprtuUN7o0i6nf67PwrlNoWMNuAyP1bPEB6BrQ3wbWtqsqJoJy2nVC4rOQ8ADHZsxzZ4AfB8gywv0YkA24/J+N76l1Un4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F6bnUYbt; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="F6bnUYbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780581886; x=1780841086;
	bh=Lmd8jPKsPgXoEtRoEzRG/Af+1/6hYOlWuF1RQCZm/BY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F6bnUYbtOZvfGev0dgV+iorSNregKT7JH38Mi4XLoWs8TwdmsWmBf45obmIn7GtdQ
	 SDlDsUIWd6/TYA1vYToQnLS9obXaBlnfZKP9Bf0I1h0WhbJ3KiXF7U8BZ0V/sj5PZH
	 /jTI0T0j/Krf8rfPxMtAQGfWcSjx4Dph2aQyf/yIaVgoxGjkENi96LZbaMK7L4tD2B
	 kC43A12fUbJTTS7A8duQ9asZbD7llhdwPgrHVeHcMJVgeLSlymOivsVnunfcANi2pq
	 APUhGBlo9vP5j2Rxv1d9GxRlBqqXTn4Oo09t+NEmyYE/I+Z1Ba+9r01tM93eaJFwZD
	 cryEcwZ6BISSg==
Date: Thu, 04 Jun 2026 14:04:42 +0000
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
In-Reply-To: <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me> <20260529-milos-iris-v2-2-7a763d7195ae@pm.me> <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2f96564793f61257723ed528a1b886733121e797
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, June 4th, 2026 at 8:16 AM, Vishnu Reddy <busanna.reddy@oss.qua=
lcomm.com> wrote:

>=20
> On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> > Add support for the Milos Iris codec. This only supports the variant
> > found on the SM7635-AB that has half of it's pipes disabled via efuse.
>
> This patch appears to be based on an older codebase. There are changes al=
ready
> merged in this file prior to your submission. Please work on latest code =
base.

I rebased on top of 7.1.0-rc5 before submitting, should I rebase on linux-n=
ext
instead?

Thanks,
Alex 
