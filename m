Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785433E00A3;
	Thu, 23 Jul 2026 21:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840868; cv=pass; b=cMWJnMBuyvVI9kJ0GWu+f27GIZRhuEQk9uFV7iGmlYB4yJevEiwe6eQbjxMIfMWH+22p9ZMG/aNLjVzmPwbBdTc+MnpLL0JOkXBxRUherd6MMmWOfVY4gsqdihgvl4SedZWWRGHNVv7C5HQ4uqxVy7mCDlIiORg1Qu02omyCc6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840868; c=relaxed/simple;
	bh=onML3DLVMKuPRl+V+Az/a14wN5ZS4jTlJNcdrRmQV9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGYH6+TPgaZ7hVKyVSljU2ZC29lPE1lRgR07sRlNHKoIjpKOdtqmtPRpif9BS8OxyrPO4Tuqz95ble5IwTjM7aRQ7izDnHQmjUw+1b1ghBorHgawEUdMlP+Ht15a0ANs3NobxZPmJYlVHqrb0829ykS/Ac7cRVIHnQkjVPd6kFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=amPpSWRD; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="amPpSWRD"
ARC-Seal: i=1; a=rsa-sha256; t=1784840846; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UbSRRyiq4UBWkWjCiZwEN5+D5j44j59m4V+dy12Vq9SuquHzklkgkkxFvxLZBXsdaCDQpnDXK1fEYeodd091n2o8AwdnjNt3NrTpe+JqWPN9YUvoMx/Uy85zfX0ptIVfFUZmssPlP240CtutyjL1kxzynL/cWVuq/qqpmTgREgI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840846; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ylh7Y4NM96Y1K3UYEmAplxHb/OJOQpXgOdrp8UvyGms=; 
	b=T7FkKlw3eCyXnnBBwJ510N7uYE9YT6eJzc0E70BMSZXgM+avST8NeXC18IgLhQb/rnjTqjFh8EloKV9x+S+rdiTcvaXkpmPSM5hRt37TQd7zp0jdqU+utA62MP9onAHbhDSpBCbQANuGdfmfps6i1HnIo5NIus7aFtztKE/SCXg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840846;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ylh7Y4NM96Y1K3UYEmAplxHb/OJOQpXgOdrp8UvyGms=;
	b=amPpSWRDaVPD67O0JPV3NK3XDV1KW3LPZtW2RUJOwZgfoaXxsopf0pftnEIckLTa
	muUl8zZqtJK2bS2vCy1sYdDkxx44QS2HCSrhSJbX6NWnLgolqxe0bzkUe4kqk3O8/kw
	p2fmwLgqyI55EuxiMlruQDA2O7nd9B/GtShEqMug=
Received: by mx.zohomail.com with SMTPS id 178484084539279.68028284519187;
	Thu, 23 Jul 2026 14:07:25 -0700 (PDT)
Message-ID: <6ec14924-7e29-43cb-963d-cf9703f03ebe@collabora.com>
Date: Fri, 24 Jul 2026 00:07:21 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-2-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260721064115.64809-2-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/21/26 09:41, Igor Paunovic wrote:
> The HDMI RX controller can expose the audio embedded in the incoming
> HDMI stream as an ALSA capture device. Document the #sound-dai-cells
> property so that a sound card can reference the HDMI RX audio DAI.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v4 (both suggested by Krzysztof Kozlowski):
> - reference dai-common.yaml and switch additionalProperties to
>   unevaluatedProperties: false
> - drop the consumer comment from the binding example
> 
> Changes in v3:
> - no changes
> 
> Changes in v2 (all suggested by Sebastian Reichel):
> - reworded the commit message to describe the hardware
> - property description now documents the DAI indexes (0 = I2S,
>   1 = S/PDIF)
> - moved the consumer reference into the binding example
>  .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> index b7f6c87..b80660d 100644
> --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -78,6 +78,13 @@ properties:
>        The phandle of the syscon node for the Video Output GRF register
>        to enable EDID transfer through SDAIN and SCLIN.
>  
> +  "#sound-dai-cells":
> +    const: 1
> +    description:
> +      The HDMI RX controller has two digital audio interfaces, one for
> +      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
> +      I2S and 1 for S/PDIF.
> +
>  required:
>    - compatible
>    - reg
> @@ -90,7 +97,10 @@ required:
>    - pinctrl-0
>    - hpd-gpios
>  
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -129,4 +139,5 @@ examples:
>        pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
>        pinctrl-names = "default";
>        hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
> +      #sound-dai-cells = <1>;
>      };

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
