Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9224D3CE0BB;
	Thu, 23 Jul 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790798; cv=none; b=poLnzvVUbasQeSuT7Vdy34J4yTzq27ZeZdsC2qDHYUIYKDEafuYUc68aOrlBDrcEQZt8LirL8zu6Ml/QsF0D0EhWcrud82KPk22QoEFoIaoyAnSGI1Zx+19pMCLXvsCL305lKmP50Ec3pnr/GyKAIx4EHcougO1JmuybWcO46tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790798; c=relaxed/simple;
	bh=7ULSNhJ+JAjeMc3Mqcg+WM3zRoMCJziGGnaCt2pYDPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/vj02Q1fexXVerNwzn53CaQVvzEom/wPUq1AsPKEmJYxhkMhg+SfeaQzyVcaOVbuQ4GlsraJNzP1kangECD/6I0H0AHUfiD3ZAiRrwnfPGebm3/886qT3FKW8m6eMH0GXITRM6al5xHAAkmGnDoyyaeabMLCUHO3Hgw/g/XIYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BAB1F000E9;
	Thu, 23 Jul 2026 07:13:16 +0000 (UTC)
Date: Thu, 23 Jul 2026 09:13:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hermes Wu <Hermes.wu@ite.com.tw>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] media: i2c: add driver for ITE IT6625/IT6626
Message-ID: <20260723-competent-poised-jaguarundi-9ea2c7@quoll>
References: <20260723-upstream-it6625-it6626-v7-0-f8175bb0ea12@ite.com.tw>
 <20260723-upstream-it6625-it6626-v7-2-f8175bb0ea12@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-upstream-it6625-it6626-v7-2-f8175bb0ea12@ite.com.tw>

On Thu, Jul 23, 2026 at 10:44:03AM +0800, Hermes Wu wrote:
> +	mutex_init(&it6625->it6625_lock);
> +	INIT_DELAYED_WORK(&it6625->hpd_delayed_work, it6625_hpd_delayed_work);
> +	INIT_WORK(&it6625->polling_work, it6625_polling_work);
> +
> +	if (client->irq) {
> +		err = devm_request_threaded_irq(&client->dev, client->irq,

You do not have interrupts. Read your binding again. You are not
allowed to sneak in any undocumented ABI.

> +						NULL, it6625_irq_handler,
> +						IRQF_TRIGGER_LOW |
> +						IRQF_ONESHOT |
> +						IRQF_NO_AUTOEN,
> +						"it6625", it6625);
> +		if (err)
> +			return err;
> +	} else {
> +		dev_info(it6625->dev, "no IRQ, falling back to polling");
> +		timer_setup(&it6625->timer, it6625_irq_poll_timer, 0);
> +	}
> +
> +	sd = &it6625->sd;
> +	err = it6625_init_v4l2_subdev(it6625);
> +	if (err)
> +		goto err_clean_work_queues;
> +
> +	err = v4l2_ctrl_handler_setup(sd->ctrl_handler);
> +	if (err)
> +		goto err_clean_hdl;
> +
> +	it6625->cec_adap = cec_allocate_adapter(&it6625_cec_adap_ops,
> +						it6625, dev_name(it6625->dev),
> +						CEC_CAP_DEFAULTS |
> +						CEC_CAP_MONITOR_ALL |
> +						CEC_CAP_PHYS_ADDR,
> +						CEC_MAX_LOG_ADDRS);
> +	if (IS_ERR(it6625->cec_adap)) {
> +		err = PTR_ERR(it6625->cec_adap);
> +		dev_err(it6625->dev, "%s %d", __func__, __LINE__);
> +		goto err_clean_hdl;
> +	}
> +
> +	err = cec_register_adapter(it6625->cec_adap, &client->dev);
> +	if (err < 0) {
> +		dev_err(it6625->dev, "%s: failed to register the cec device", __func__);
> +		cec_delete_adapter(it6625->cec_adap);
> +		it6625->cec_adap = NULL;
> +		goto err_clean_hdl;
> +	}
> +
> +	it6625_debugfs_init(it6625, client);
> +
> +	it6625_initial_setup(it6625);
> +	it6625_v4l2_sd_ctrl_update(sd);
> +
> +	err = v4l2_async_register_subdev(sd);
> +	if (err < 0) {
> +		dev_err(it6625->dev, "%s %d err=%d", __func__, __LINE__, err);
> +		goto err_clean_debugfs;
> +	}
> +
> +	if (client->irq)
> +		enable_irq(client->irq);
> +	else
> +		mod_timer(&it6625->timer, jiffies + msecs_to_jiffies(POLL_INTERVAL_MS));
> +
> +	return 0;
> +
> +err_clean_debugfs:
> +	debugfs_remove_recursive(it6625->debugfs_dir);
> +	cec_unregister_adapter(it6625->cec_adap);
> +err_clean_hdl:
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&it6625->hdl);
> +
> +err_clean_work_queues:
> +	if (!client->irq)
> +		timer_shutdown_sync(&it6625->timer);
> +	cancel_work_sync(&it6625->polling_work);
> +	cancel_delayed_work_sync(&it6625->hpd_delayed_work);
> +	mutex_destroy(&it6625->it6625_lock);
> +	return err;
> +}
> +
> +static void it6625_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct it6625 *it6625 = sd_to_6625(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_device_unregister_subdev(sd);
> +
> +	if (client->irq)
> +		disable_irq(client->irq);
> +	else
> +		timer_shutdown_sync(&it6625->timer);
> +
> +	cancel_work_sync(&it6625->polling_work);
> +	cancel_delayed_work_sync(&it6625->hpd_delayed_work);
> +	debugfs_remove_recursive(it6625->debugfs_dir);
> +	cec_unregister_adapter(it6625->cec_adap);
> +	mutex_destroy(&it6625->it6625_lock);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&it6625->hdl);
> +}
> +
> +static const struct i2c_device_id it6625_id[] = {
> +	{ .name = "it6625", .driver_data = IT6625_CHIP },
> +	{ .name = "it6626", .driver_data = IT6626_CHIP },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, it6625_id);
> +
> +static const struct of_device_id it6625_of_match[] = {
> +	{ .compatible = "ite,it6625", .data = (void *)IT6625_CHIP },
> +	{ .compatible = "ite,it6626", .data = (void *)IT6626_CHIP },


I don't see any difference in the code between these two, so your
devices are simply compatible, no?

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, it6625_of_match);
> +
> +static struct i2c_driver it6625_driver = {
> +	.driver = {
> +		.name = "it6625",
> +		.of_match_table = of_match_ptr(it6625_of_match),

Drop of_match_ptr. You have a warning here, most likely.

Best regards,
Krzysztof

