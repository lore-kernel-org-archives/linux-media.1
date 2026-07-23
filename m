Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D263F6C59;
	Thu, 23 Jul 2026 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840959; cv=pass; b=h8dc24iviIY6uA8pXG4yjOnMEv7ZFFf/e5wV2suaq1YjhE/B3x18rCJHBUuIBBo0TJLNXVaLOwxv430ofz9pDPFdAeMng6JeulnsfZOFKeJe5JSLQtw/RCD+1CgL5yyTaxuSI3IdbyTZjXwLtT74Dy5rLyfwSk9ftZzYXz0Dx1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840959; c=relaxed/simple;
	bh=MVh9b2XDnogMZNqlXPB+rRa2iAqbuLEsXVQ5bg9ziU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xnbyktjvor7KFjRXp6urM47DB8uMpyfZwkCOvuPXEDofmnF3vyQB4ui1eWA2mHp3ewiA2bn7t5choRCPx+1RGFMr79lIHJNSqHAMTzY8ozzDLOy66/QTNB4FvNWB7bOYLS2p/4V4kRzCu9k40gKgr+XTBcUjf7jETuC2I9DL0Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=cOUdxoT/; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="cOUdxoT/"
ARC-Seal: i=1; a=rsa-sha256; t=1784840931; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nWZ907QV3to2K81Jlq1kCqW0gDPRSsxVhJObunskYpoa3kdZynXbXnleneHqnZ5LOEoAV8VlYSwr0wT8Lhl0A6SNAqfzYQzZGNPiuccr/M1aDRZCFJYIIqvRj4hzCCDhBbwOHBFnifN7nOQPDHkwcrzThh0stqsRXwnZpiavzgQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840931; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SLdXhgYMtQZkOZKJBRViZWi5CKisW6NN1fRZfJwSl64=; 
	b=TyiaX/zhBYtcwALXeLfhnhuhGms3+npx/pBzVA48DeRp1oPDazJwGGkPLSQGCcg7nItQGr9xNlQWcxBYvIXS/doI0u5MHhYcpfJ0tt1JeM+y9rVWAdBelK06Q7KK/50ne7fztjHyLDjJUvgegGhbqrMPsr8CJSKAYm5aDPXr0yw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840931;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SLdXhgYMtQZkOZKJBRViZWi5CKisW6NN1fRZfJwSl64=;
	b=cOUdxoT/oo0DFrQSVGZIqcmHWUyyFaoTZQfve53gbLm8uXsiwQeD9tmfuUHVWDuu
	9mhJw3ce2gCzbITHs3JKOkL0Aq1Spp8RdVP6OATBL8/IN6fxxcD3TbQ6VciRhDCuPxo
	WGOJcIg1z5fCIy0XNYkDQ/m1PsVFJ0O0WyPSKfLk=
Received: by mx.zohomail.com with SMTPS id 1784840928227899.1785246524836;
	Thu, 23 Jul 2026 14:08:48 -0700 (PDT)
Message-ID: <9a05f046-e408-4b2e-abc1-4aef85838d28@collabora.com>
Date: Fri, 24 Jul 2026 00:08:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-5-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260721064115.64809-5-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/21/26 09:41, Igor Paunovic wrote:
> Enable the shared HDMI RX sound card and the i2s7_8ch interface it
> uses. Together with the audio capture support in the snps_hdmirx
> driver this exposes a capture-only ALSA card fed by the HDMI input.
> 
> Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> follows the source sample rate and stays in sync via the FIFO-level
> clock tracking in the driver.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v4:
> - only enable the shared hdmi_receiver_sound card and i2s7_8ch, now
>   that the card definition lives in rk3588-extra.dtsi (Sebastian
>   Reichel)
> 
> New in v3.
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 9950d11..9f9a303 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -171,6 +171,10 @@
>  	status = "okay";
>  };
>  
> +&hdmi_receiver_sound {
> +	status = "okay";
> +};
> +
>  &hdptxphy0 {
>  	status = "okay";
>  };
> @@ -247,6 +251,10 @@
>  	status = "okay";
>  };
>  
> +&i2s7_8ch {
> +	status = "okay";
> +};
> +
>  &led_blue_gpio {
>  	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
>  	status = "okay";

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
