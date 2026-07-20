Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54438239E9B;
	Mon, 20 Jul 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558841; cv=none; b=pcqyWQURWhrLB7lVIyC9RXaNbW3tmG1sELET2pqtGkMjZ7h50ES64+hgXyC30zEGViL51RDqolYDqy5G9LbtovtgJKGyfIBjJrMUn0kdmtvmxEJHY6pcWpQvJjr67YWi9CX4keAUk3eTXvOpyXGeeetHJvTvBe3KcwueN+49P34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558841; c=relaxed/simple;
	bh=7usY5EwCpuZoOGf6lLbU4bmS0LywjqU4n6AO2hoOiJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6ab672hN4OjAgOTauolPmF76ctC26zJiBootTVvuHD1/y+nDDMtcJpeB/VmnSbNzH+TeWhPtJoiJnHHvK/SkTETrTK8vAlxrgc71TM4kdSaTwQ8DLS3jpMbezlhvAXJRK8WVKls8iFw/H8xRKIfwcaH7aTwIxuXf4n3qFuaQ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ULtPkYE8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ULtPkYE8"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 572D5270;
	Mon, 20 Jul 2026 16:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784558777;
	bh=7usY5EwCpuZoOGf6lLbU4bmS0LywjqU4n6AO2hoOiJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ULtPkYE88P04sj21MlqhY4/ta2qMSufYkkcpRG5FzdXk29Ax7VUOYFOjl291ITa6j
	 FpPYgU1A51SyAj7UvrtPyBTvsVA4TZxOrmbUQ75/zuiPLKcHZDt20NargJ02UOozLp
	 oqCz9EGDrSbEB1FUrXKc0uCeUh7AmBpDdGWz4Te8=
Message-ID: <960ebecb-eabb-47ae-bce7-ed5247f5c6f7@ideasonboard.com>
Date: Mon, 20 Jul 2026 17:47:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ds90ub960: Support multi-channel
 sensors
To: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: mchehab@kernel.org, jai.luthra@ideasonboard.com, devarsht@ti.com,
 y-abhilashchandra@ti.com
References: <20260720110927.3570235-1-r-donadkar@ti.com>
 <20260720110927.3570235-3-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260720110927.3570235-3-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/07/2026 14:09, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Before this, the deserializer would ignore the virtual channel (VC) ID
> set in the incoming CSI packets, and set the ID to the RX port number in
> the outgoing packets. This was done to support multiple single-channel
> cameras, all sending packets with the same default VC ID = 0.
> 
> Now we check which (and how many) channels are under use on any incoming
> FPDLink port, and map it to available channels on the outgoing CSI port.
> 
> Add a dedicated virtual channel mapping for ub9702 deserializers which
> require different VC configuration compared to ub960. Update the
> configuration logic to select the appropriate map based on the
> deserializer type.

So what's the channel routing here, then? I don't think the above really 
explains it. It also makes it sound like the routing for UB9702 is 
different compared to UB960. Does that refer only to the code, but the 
result is the same, or is the routing result different?

Reading the above, and with a quick glance to the code, makes me think 
you map an incoming stream to a specific output VC, thus you can support 
four streams with this (although comment in the code says UB9702 only 
supports VC0 and VC1?). But that's not what we want. If a sensor sends 
video and embedded data, both on VC0 but with different datatypes, 
allocating a separate VC for those two streams would allow us to only 
support two cameras.

But maybe that's not what the code does, so a better explanation would 
be nice.

Also, I think this breaks UB954. You even drop one UB954 check in the 
patch, and miss checking for it in multiple places.

> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>   drivers/media/i2c/ds90ub960.c | 194 +++++++++++++++++++---------------
>   1 file changed, 109 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 653dc7a4eee5..9ce6d9e6e3e8 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -72,6 +72,7 @@
>   #define UB960_MAX_RX_NPORTS	4
>   #define UB960_MAX_TX_NPORTS	2
>   #define UB960_MAX_NPORTS	(UB960_MAX_RX_NPORTS + UB960_MAX_TX_NPORTS)
> +#define UB960_MAX_VC		4
>   
>   #define UB960_MAX_PORT_ALIASES	8
>   
> @@ -3471,40 +3472,100 @@ static int ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
>    */
>   
>   /*
> - * The current implementation only supports a simple VC mapping, where all VCs
> - * from a one RX port will be mapped to the same VC. Also, the hardware
> - * dictates that all streams from an RX port must go to a single TX port.
> + * Map incoming streams with different virtual channels from 1-4 sensors to
> + * unique VCs on CSI TX0. Sensors using multiple VCs will work, but due to
> + * limited total channels (4) this will reduce the total number of sensors that
> + * can work simultaneously.
>    *
> - * This function decides the target VC numbers for each RX port with a simple
> - * algorithm, so that for each TX port, we get VC numbers starting from 0,
> - * and counting up.
> + * The current implementation is limited to using a single CSI TX port
> + * at a time (either TX0 or TX1 and not both simultaneously),
> + * as that is the most common HW configuration found on boards with DS90UB960.
> + * For using both CSI TX0 & TX1 the below method will need significant changes.
>    *
> - * E.g. if all four RX ports are in use, of which the first two go to the
> - * first TX port and the secont two go to the second TX port, we would get
> - * the following VCs for the four RX ports: 0, 1, 0, 1.
> + * VC mapping differs between ub960 and ub9702 deserializers:
> + * For ub960:
> + *		- Each VC uses 2 bits in the mapping register
> + *		- Supports up to 4 virtual channels (VC0-VC3)
> + * For ub9702:
> + *		- Each VC uses 4 bits in the mapping register
> + *		- Currently uses only 2 virtual channels (VC0, VC1)
>    *
> - * TODO: implement a more sophisticated VC mapping. As the driver cannot know
> - * what VCs the sinks expect (say, an FPGA with hardcoded VC routing), this
> - * probably needs to be somehow configurable. Device tree?
> + * The mapping registers determine which output VC a given input VC
> + * will be mapped to when forwarding data from the deserializer.
>    */
> -static void ub960_get_vc_maps(struct ub960_data *priv,
> -			      struct v4l2_subdev_state *state, u8 *vc)
> +
> +static void ub960_get_vc_maps(struct ub960_data *priv, u8 *vc_map)
>   {
> -	u8 cur_vc[UB960_MAX_TX_NPORTS] = {};
> -	struct v4l2_subdev_route *route;
> -	u8 handled_mask = 0;
> +	struct device *dev = &priv->client->dev;
> +	u8 nport, available_vc = 0;
>   
> -	for_each_active_route(&state->routing, route) {
> -		unsigned int rx, tx;
> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> +		struct v4l2_mbus_frame_desc source_fd;
> +		bool used_vc[UB960_MAX_VC] = {false};
> +		u8 vc, cur_vc = available_vc;
> +		int j, ret;
> +		u8 map;
>   
> -		rx = ub960_pad_to_port(priv, route->sink_pad);
> -		if (BIT(rx) & handled_mask)
> +		if (!priv->rxports[nport])
>   			continue;
>   
> -		tx = ub960_pad_to_port(priv, route->source_pad);
> +		ret = v4l2_subdev_call(priv->rxports[nport]->source.sd, pad,
> +				       get_frame_desc,
> +				       priv->rxports[nport]->source.pad,
> +				       &source_fd);
> +		/* Mark channels used in source in used_vc[] */
> +		if (!ret) {
> +			for (j = 0; j < source_fd.num_entries; ++j) {
> +				u8 source_vc = source_fd.entry[j].bus.csi2.vc;
> +
> +				if (source_vc < UB960_MAX_VC)
> +					used_vc[source_vc] = true;
> +			}
> +		} else if (ret == -ENOIOCTLCMD) {
> +			/* assume VC=0 is used if sensor driver doesn't provide info */
> +			used_vc[0] = true;
> +		} else {
> +			continue;
> +		}

This silently ignores errors. Any reason why we can't return error codes?

> +
> +		/* Start with all channels mapped to first free output */
>   
> -		vc[rx] = cur_vc[tx]++;
> -		handled_mask |= BIT(rx);
> +		if (priv->hw_data->chip_type == UB960) {
> +			map = (cur_vc << 6) | (cur_vc << 4) | (cur_vc << 2) |
> +				(cur_vc << 0);
> +		} else {
> +			map = (cur_vc << 4) | (cur_vc << 0);
> +		}
> +
> +		/* Map actually used to channels to distinct free outputs */
> +		for (vc = 0; vc < UB960_MAX_VC; ++vc) {
> +			if (used_vc[vc]) {
> +				if (priv->hw_data->chip_type == UB960) {
> +					/* For ub960: 2 bits per VC */
> +					map &= ~(0x03 << (2 * vc));
> +					map |= (cur_vc << (2 * vc));
> +				} else {
> +					/* For ub9702: 4 bits per VC */
> +					map &= ~(0x0f << (4 * vc));
> +					map |= (cur_vc << (4 * vc));
> +				}
> +				++cur_vc;
> +			}
> +		}
> +
> +		/* Don't enable port if we ran out of available channels */
> +		if (cur_vc > UB960_MAX_VC) {
> +			dev_err(dev,
> +				"No VCs available for RX port %d\n",
> +				nport);
> +			continue;
> +		}
> +
> +		/* Enable port and update map */
> +		vc_map[nport] = map;
> +		available_vc = cur_vc;
> +		dev_dbg(dev, "%s: VC map for port %d is 0x%02x",
> +			__func__, nport, map);
>   	}
>   }
>   
> @@ -3552,45 +3613,6 @@ static int ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
>   				 UB960_SR_FWD_CTL1_PORT_DIS(nport), NULL);
>   }
>   
> -/*
> - * The driver only supports using a single VC for each source. This function
> - * checks that each source only provides streams using a single VC.
> - */
> -static int ub960_validate_stream_vcs(struct ub960_data *priv)
> -{
> -	for_each_active_rxport(priv, it) {
> -		struct v4l2_mbus_frame_desc desc;
> -		int ret;
> -		u8 vc;
> -
> -		ret = v4l2_subdev_call(it.rxport->source.sd, pad,
> -				       get_frame_desc, it.rxport->source.pad,
> -				       &desc);
> -		if (ret)
> -			return ret;
> -
> -		if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> -			continue;
> -
> -		if (desc.num_entries == 0)
> -			continue;
> -
> -		vc = desc.entry[0].bus.csi2.vc;
> -
> -		for (unsigned int i = 1; i < desc.num_entries; i++) {
> -			if (vc == desc.entry[i].bus.csi2.vc)
> -				continue;
> -
> -			dev_err(&priv->client->dev,
> -				"rx%u: source with multiple virtual-channels is not supported\n",
> -				it.nport);
> -			return -ENODEV;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>   static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>   					       struct v4l2_subdev_state *state)
>   {
> @@ -3606,11 +3628,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>   	struct v4l2_subdev_route *route;
>   	int ret;
>   
> -	ret = ub960_validate_stream_vcs(priv);
> -	if (ret)
> -		return ret;
> -
> -	ub960_get_vc_maps(priv, state, vc_map);
> +	ub960_get_vc_maps(priv, vc_map);
>   
>   	for_each_active_route(&state->routing, route) {
>   		struct ub960_rxport *rxport;
> @@ -3676,16 +3694,14 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>   	for_each_active_rxport(priv, it) {
>   		unsigned long nport = it.nport;
>   
> -		u8 vc = vc_map[nport];
> -
>   		if (rx_data[nport].num_streams == 0)
>   			continue;
>   
>   		switch (it.rxport->rx_mode) {
>   		case RXPORT_MODE_RAW10:
>   			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
> -				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT),
> -				&ret);
> +				rx_data[nport].pixel_dt | (nport << UB960_RR_RAW10_ID_VC_SHIFT),
> +					&ret);

The above changes the VC for a RAW10 mode stream to nport... Why is 
that? Also the ub960_get_frame_desc doesn't reflect this change.

>   			ub960_rxport_write(priv, nport,
>   				UB960_RR_RAW_EMBED_DTYPE,
> @@ -3701,15 +3717,10 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>   
>   		case RXPORT_MODE_CSI2_SYNC:
>   		case RXPORT_MODE_CSI2_NONSYNC:
> -			if (priv->hw_data->chip_type == UB960 ||
> -			    priv->hw_data->chip_type == UB954) {
> -				/* Map all VCs from this port to the same VC */
> -				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
> -						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
> -						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
> -						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
> -						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)),
> -						   &ret);
> +			if (priv->hw_data->chip_type == UB960) {
> +				ub960_rxport_write(priv, nport,
> +						   UB960_RR_CSI_VC_MAP,
> +						   vc_map[nport], &ret);
>   			} else {
>   				unsigned int i;
>   
> @@ -3717,8 +3728,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>   				for (i = 0; i < 8; i++)
>   					ub960_rxport_write(priv, nport,
>   							   UB9702_RR_VC_ID_MAP(i),
> -							   (nport << 4) | nport,
> -							   &ret);
> +							   vc_map[nport], &ret);
>   			}
>   
>   			break;
> @@ -3965,6 +3975,11 @@ static int ub960_set_routing(struct v4l2_subdev *sd,
>   	return _ub960_set_routing(sd, state, routing);
>   }
>   
> +static inline u8 ub960_get_output_vc(u8 map, u8 input_vc)
> +{
> +	return (map >> (2 * input_vc)) & 0x03;
> +}

What's this about?

> +
>   static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   				struct v4l2_mbus_frame_desc *fd)
>   {
> @@ -3982,7 +3997,7 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   
>   	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
>   
> -	ub960_get_vc_maps(priv, state, vc_map);
> +	ub960_get_vc_maps(priv, vc_map);
>   
>   	for_each_active_route(&state->routing, route) {
>   		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> @@ -4025,7 +4040,16 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   		fd->entry[fd->num_entries].length = source_entry->length;
>   		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
>   
> -		fd->entry[fd->num_entries].bus.csi2.vc = vc_map[nport];
> +		if (priv->hw_data->chip_type == UB960)
> +			fd->entry[fd->num_entries].bus.csi2.vc =
> +				(vc_map[nport] >> (2 * source_entry->bus.csi2.vc)) & 0x03;
> +		else
> +			fd->entry[fd->num_entries].bus.csi2.vc =
> +				(vc_map[nport] >> (4 * source_entry->bus.csi2.vc)) & 0x0f;
> +
> +		dev_dbg(dev, "Mapping sink %d/%d to output VC %d",
> +			route->sink_pad, route->sink_stream,
> +			fd->entry[fd->num_entries].bus.csi2.vc);
>   
>   		if (source_fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>   			fd->entry[fd->num_entries].bus.csi2.dt =

