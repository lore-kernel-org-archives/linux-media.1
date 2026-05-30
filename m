Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865028030E;
	Sat, 30 May 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102001; cv=none; b=Gea0BFG2YEnYOHU8cpP2Zyp2Uie/NnHMDyljkOV5zuwVV1pX5PLlfHf2IJ0VT3GqUcPL7SYFUTehXCM6oC5OA4TVVeMqPagRsQ8cMBqsKskqkrfdG0ZAPgyQqPxzlGJoNmB5bO9vuyWPvcQCj74xCL2Y1T8GMoDpbe0oMiYZWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102001; c=relaxed/simple;
	bh=a7K3m4u5t/d2JaFUJqClXibVhKIGjCQFN05qFvNZg0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ihq6urPL6XA5mbKBfxMAtTwh29MFophbUNIjiY6qCbbzfabRUGdTzQRmlG37FAdn/Gy0r10fAJblVXnx1iGfl8RIayS1VGUXyDt+BYiGDpSf4ppymj+shxd4K98yGzsTev5x+c6RA9EsHDu+PL5rRXhjSc0fWyNbAzvylRF1lYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3XUPkF+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3XUPkF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA181F00899;
	Sat, 30 May 2026 00:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102000;
	bh=gfG5bKFYCClAy8inB7Dbn7ap9CA5R9+PderCKI59Qew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c3XUPkF+DaAplNbxPLudoGyPoncKjcV1QKzUXNQzb98A/lI8qfJaoNnNpRTqfGqj6
	 uZGKmYPqf5I7YJjhwQcPzQRkMy69wEqkib69wdVvS78UZN9stJLFB0wcfhE0ZlJEuF
	 xnryYQBNM17MFD16FAh79uuVEKvgsnb1r7jeUmJoCrkJzpWfckxkQFnvRHkkvemeV8
	 1JE2ltjin9TzPqBEtqQem2bMA4S84So1uzmkeffTAWUBJZq07KFUSh75SG2sPV+Vxk
	 EW3JfYssUxrL4ql6DpiSTtDtVzPhQTPs4zLk3SSMpl7JgzIAA+BaKasae2C+beeTvG
	 jYisLe4X9rshg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/15] arm64: dts: qcom: kodiak: Add EL2 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260522115936.201208-2-sumit.garg@kernel.org>
References: <20260522115936.201208-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:40 +0000
Message-Id: <20260530004640.8AA181F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to "apply it to Kodiak IOT variant dev=
ices to create -el2.dtb for each of them alongside 'normal' dtb." However, =
only `qcs6490-rb3gen2-el2.dtb` is actually added to the Makefile. Other Kod=
iak IOT variants (e.g., `qcs6490-radxa-dragon-q6a`) are completely omitted.
--

commit dae207f029919c9e5d599bad87797d9c3c3d8c49
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Add EL2 overlay

This commit introduces a new EL2-specific DeviceTree overlay for Kodiak
boards to allow booting Linux in EL2 without the Gunyah hypervisor. It
configures remote processor firmware IOMMU streams and the hardware
watchdog while disabling unsupported subsystems like the modem and venus.

Link: https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boo=
t-developer-touchpoints.html#uefi

> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.

[Severity: Medium]
Is this description accurate? The commit message states the overlay is
applied to all Kodiak IOT variant devices, but only the qcs6490-rb3gen2
device has the -el2.dtb target added below.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 4ba8e73064194..28123cdc9de26 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
[ ... ]
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs615-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs :=3D qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2-el2.dtb

If the intent was to also apply this overlay to other variants like
qcs6490-radxa-dragon-q6a, would the fdtoverlay step fail?=20

Other Kodiak boards use /delete-node/ for remoteproc_mpss and
remoteproc_wpss because they lack the hardware. It looks like applying
kodiak-el2.dtso to those boards would result in an error when the overlay
attempts to modify these non-existent nodes:

> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/d=
ts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 0000000000000..520ed582370da
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
[ ... ]
> +&remoteproc_mpss {
> +	status =3D "disabled";
> +};
> +
> +&remoteproc_wpss {
> +	iommus =3D <&apps_smmu 0x1c03 0x1>,
> +		 <&apps_smmu 0x1c83 0x1>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D1
