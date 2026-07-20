Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81D3B635B;
	Mon, 20 Jul 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556000; cv=none; b=FWmJkp03MWs2TeAm98LiqAOJR3lFnhTMgrESF8IcorR/r46K3d3p7mPSTqyM4IanDp1Tr4LqfUDpaqzMmEmSp1h1dYsb1JZkdanSYjgZayuexpjpfuGnaXyxLqV+Z4zORfVDKiMPOdHNXnXGuWGmmSf5btkhiMIlWeHOAU1iqRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556000; c=relaxed/simple;
	bh=vpPQHh4Tq42jZNX05PtPoZPEiVKOUDdEBStXAAExV5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3bWnY+kvGBKJG8Ziha33rNIynCfp2Lbb6e4rmdj1geF2p0XxRv0N77DZi4zYXLPVXsljGaWNdTQPyEHGMX9h5zDOhRHfNskT8eIS2LSWMf5Y3ig5nr11AQGvm7i1MWaTS2nUdAi6SepubAvzbTNxcfrN+kyy1Lscykl1w3J6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E5N84PS2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E5N84PS2"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43A47270;
	Mon, 20 Jul 2026 15:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784555937;
	bh=vpPQHh4Tq42jZNX05PtPoZPEiVKOUDdEBStXAAExV5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E5N84PS2kwGPagsmxotPdp8qHZ0QFXXLVWUgkwf/oJbr0gctBT/XC9grrfpdn3/+/
	 pVWVetg3rt9W8FpV/pttvPFJDrYlFj9WL7bD8dXa6J9jrGckR7SVNxBLhrhfaas1xB
	 nYuhLIRo1zsE0tDFKKJYuT4hbdFu5aMhsJG2jDk8=
Message-ID: <f2182eec-e972-4833-9e50-a9a444bf2d46@ideasonboard.com>
Date: Mon, 20 Jul 2026 16:59:52 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: i2c: ds90ub960: Enable CSI TX1 port
To: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: mchehab@kernel.org, jai.luthra@ideasonboard.com, devarsht@ti.com,
 y-abhilashchandra@ti.com
References: <20260720110927.3570235-1-r-donadkar@ti.com>
 <20260720110927.3570235-2-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260720110927.3570235-2-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/07/2026 14:09, Rishikesh Donadkar wrote:
> From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> 
> The DS90UB960 chip has two CSI-2 transmit ports (TX0 and TX1), but the
> current driver implementation only utilizes TX0. To enable TX1 as the
> active output port, the I2C Bidirectional Control Channel (BCC) mapping in
> the RX_PORT_CTL register must be configured to use I2C Slave Port 1.
I think you could expend the above a bit to explain how the HW handles 
the I2C routing.

> This patch adds a new function, ub960_parse_active_ports(), which is
> called during driver initialization to scan the device tree and identify
> which RX and TX ports are enabled. The function creates bitmasks
> representing the active ports and uses these masks to correctly configure
> the RX_PORT_CTL register, ensuring proper port routing for whichever TX
> port is in use.

This doesn't quite explain how the decisions about routing are done. 
What if two TX ports are enabled?

> DS90UB960 data sheet: https://www.ti.com/lit/ds/symlink/ds90ub960-q1.pdf

I don't think there's a need to link to the datasheet in the commit. 
Unless, say, you add support for a new device.

> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>   drivers/media/i2c/ds90ub960.c | 46 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 15a9797b47ac..653dc7a4eee5 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -26,6 +26,7 @@
>    * - i2c-atr could be made embeddable instead of allocatable.
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/bitops.h>
>   #include <linux/cleanup.h>
>   #include <linux/clk.h>
> @@ -76,6 +77,8 @@
>   
>   #define UB960_NUM_BC_GPIOS		4
>   
> +#define UB960_CSI_TX0			BIT(4)

This is a very strange looking define.

> +
>   /*
>    * Register map
>    *
> @@ -114,6 +117,7 @@
>   #define UB960_SR_SCL_HIGH_TIME			0x0a
>   #define UB960_SR_SCL_LOW_TIME			0x0b
>   #define UB960_SR_RX_PORT_CTL			0x0c
> +#define UB960_SR_RX_PORT_CTL_BCC_MAP		GENMASK(7, 4)
>   #define UB960_SR_IO_CTL				0x0d
>   #define UB960_SR_GPIO_PIN_STS			0x0e
>   #define UB960_SR_GPIO_INPUT_CTL			0x0f
> @@ -589,6 +593,9 @@ struct ub960_data {
>   	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
>   	s64 tx_link_freq[1];
>   
> +	u8 rx_mask;
> +	u8 tx_mask;
> +
>   	struct i2c_atr *atr;
>   
>   	struct {
> @@ -2538,7 +2545,18 @@ static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
>   	struct device *dev = &priv->client->dev;
>   	unsigned int port_lock_mask;
>   	unsigned int port_mask;
> -	int ret;
> +	u8 enabled_rxports_mask;
> +	u8 enabled_rxports;
> +	int ret = 0;
> +
> +	/* Configure I2C interface for RX ports */
> +	enabled_rxports_mask = FIELD_PREP(UB960_SR_RX_PORT_CTL_BCC_MAP, priv->rx_mask);
> +	enabled_rxports = (priv->tx_mask & UB960_CSI_TX0)  ? 0x00 : enabled_rxports_mask;

tx_mask should have bits 0 or 1 set, for TX0 and TX1.

This looks quite confusing. I think the comment could at least say 
what's the strategy here, how does it configure the ports.

Isn't this just a boolean switch? If TX0 is used, all ports are routed 
there? Else TX1 is used for all ports. Why do you even need tx_mask and 
rx_mask? And why the enabled_rxports_mask. Or maybe I just fail to read 
the code, thus a better comment or patch desc might help.

> +	ret = ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, enabled_rxports_mask,
> +				enabled_rxports, &ret);
> +	if (ret)
> +		return ret;
>   
>   	for_each_active_rxport(priv, it) {
>   		ret = ub960_init_rx_port_ub960(priv, it.rxport);
> @@ -4789,6 +4807,30 @@ static int ub960_parse_dt_txports(struct ub960_data *priv)
>   	return 0;
>   }
>   
> +static void ub960_parse_active_ports(struct ub960_data *priv)
> +{
> +	struct device *dev = &priv->client->dev;
> +	int nport;
> +
> +	priv->rx_mask = 0;
> +	priv->tx_mask = 0;
> +
> +	for (nport = 0; nport < priv->hw_data->num_rxports + priv->hw_data->num_txports; nport++) {
> +		struct fwnode_handle *ep_fwnode;
> +
> +		ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), nport, 0, 0);
> +		if (!ep_fwnode)
> +			continue;
> +
> +		if (nport < priv->hw_data->num_rxports)
> +			priv->rx_mask |= BIT(nport);
> +		else
> +			priv->tx_mask |= BIT(nport);
> +
> +		fwnode_handle_put(ep_fwnode);

Does this work (or rather, the user of tx_mask) on UB954, with 2 rx ports?

> +	}
> +}
> +
>   static int ub960_parse_dt(struct ub960_data *priv)
>   {
>   	int ret;
> @@ -5162,6 +5204,8 @@ static int ub960_probe(struct i2c_client *client)
>   	if (ret)
>   		goto err_mutex_destroy;
>   
> +	ub960_parse_active_ports(priv);
> +

We already parse rx and tx ports in ub960_parse_dt(). Wouldn't that be a 
better place to collect the masks? The existing functions are doing 
almost exactly what you function above does, aren't they?

>   	ret = ub960_parse_dt(priv);
>   	if (ret)
>   		goto err_disable_core_hw;

