Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1573F23BB;
	Thu, 23 Jul 2026 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840931; cv=pass; b=F1QQxsNoQYtfsM1yu6N/xrrrKW2rLVSQj26pbAdRv6H582lqx2dTAG52WewM0a3uKWa/ojl+bAzuHzHV+M5RdWycHI8nbI77Yw8CpRQhDOapuCKskTR/Ego9l3kM2TxRvRtXc79JPwJZfw6Dh2eenazjXV22o45/9gN/bpB8KjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840931; c=relaxed/simple;
	bh=DcuUVtGFSX1UCuJOo1sFlG6POeSFmsKPMo46iGfE+CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORcMbThEbI52HI2CQ4AjVaAo/u9KiyIxdVNZyNILT3usUOBP9BKFa2KDzyLyYdkh4m4XNcwiLBPXMM/GEudDN5HRWQVJCqFV/J4nYi8Wa+mnoCchPTyfebE6i5z2C1wytz1pKgSJ8sK81zIR8XR4+iFE9h9awnTqbUu8O999E9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=hcA++BWE; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="hcA++BWE"
ARC-Seal: i=1; a=rsa-sha256; t=1784840903; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZofzkxPKEd7lf4sDW9ciklCThBWOnDQ2GEu7rPIcNaZveH9q1nkb8kM48CYwN8GMvpuJnjxPky3on0RqbGebq8g3fVMumPEvh1gd1mpW3+ZFUDxm60Cf8a91YM086VgWBTS+gZvD/RJYzE1VwLFNiBHsbcA6a+IidzjsoqP8wwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840903; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jPX8Qo4WfHXuWtgG3KrlsoZlJSWwTSu8oW28laBWyKA=; 
	b=MUo8/zrAo8wr/AzKX4gpdUEUQCPaHTcqH4dLsSk+G0+4FPxWbet1ZIYyRJz5kc7HbT6i1zyrQsfSDypga842FuSbIdNWAiMvbi5bkAuoHTtjZy5hlx/oaKAyBf7ND+R+HcxVFFzvUe3rNZu6TuzneKEiCvpgpg38yqto651n3Ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840903;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jPX8Qo4WfHXuWtgG3KrlsoZlJSWwTSu8oW28laBWyKA=;
	b=hcA++BWE7+onuKGfOK8O7BxIQ+Jb2Es4UNStWGXOCVpgMqc5KzTXngemk9NMCmFf
	Z/5eEncvx3EMoJeG5bGDCH5D8NW+Z/8z330px0NWVDnptX7H+UjRkrPqVT88yzY3mKy
	eOIGz1lJusekYanCOTU5MKzSEySqKiWs/JaMmVGI=
Received: by mx.zohomail.com with SMTPS id 1784840899618134.47086648505854;
	Thu, 23 Jul 2026 14:08:19 -0700 (PDT)
Message-ID: <6f38788b-c577-4c79-8a27-3c0942ba1400@collabora.com>
Date: Fri, 24 Jul 2026 00:08:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK3588
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-4-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260721064115.64809-4-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/21/26 09:41, Igor Paunovic wrote:
> The Synopsys HDMI RX controller exposes two digital audio interfaces,
> one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
> property so audio cards can reference them as a codec, as documented
> by the snps,dw-hdmi-rx binding.
> 
> Add a shared simple-audio-card routing the receiver I2S DAI to
> i2s7_8ch, the receive-only I2S interface dedicated to HDMI RX, with
> the receiver as bitclock and frame master. The card is named
> "RK3588 HDMI-IN", which is what users see in alsamixer and what ALSA
> UCM matches on. It mirrors the existing HDMI TX sound cards in this
> file and is disabled by default, since not every RK3588 board routes
> HDMI RX audio; boards that do only need to flip its status.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v4 (both suggested by Sebastian Reichel):
> - define the whole sound card here as a shared, disabled-by-default
>   node mirroring the HDMI TX cards, instead of per board
> - name the card "RK3588 HDMI-IN": the name is user-visible in
>   alsamixer and matched by ALSA UCM
> 
> New in v3 (as "add #sound-dai-cells to the RK3588 HDMI receiver").
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> index a264001..e0dce15 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -23,6 +23,23 @@
>  		};
>  	};
>  
> +	hdmi_receiver_sound: hdmi-receiver-sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,name = "RK3588 HDMI-IN";
> +		simple-audio-card,bitclock-master = <&hdmiin_codec>;
> +		simple-audio-card,frame-master = <&hdmiin_codec>;
> +		status = "disabled";
> +
> +		hdmiin_codec: simple-audio-card,codec {
> +			sound-dai = <&hdmi_receiver 0>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&i2s7_8ch>;
> +		};
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -338,6 +355,7 @@
>  		reset-names = "axi", "apb", "ref", "biu";
>  		rockchip,grf = <&sys_grf>;
>  		rockchip,vo1-grf = <&vo1_grf>;
> +		#sound-dai-cells = <1>;
>  		status = "disabled";
>  	};
>  

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
