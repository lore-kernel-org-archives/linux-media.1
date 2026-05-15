Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A267544D686;
	Fri, 15 May 2026 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841757; cv=none; b=IU09naEX42tetyH8fUqv0vsrGj7NPlm84LRPHnjP9lxhwvOxYIRaKGfwGPNqqY7dP234rDkUjeis0scLzWgW04ZlMymJIbAGe8l6+sbBJa5rrmKqXsmCtG8BvJ5LnoObX2v5+P2qNmISARGnwfYaFM05ph8Q7D1fMNCP1J88/PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841757; c=relaxed/simple;
	bh=TrEbHx5wvfb8nmTnI06Lbjz3NtUdfmgRyx1f7GjOlsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXbxR6bWa/M3vyhADXg4vkG66bHYlXcCmtWrsM5gO4B6IiqPUOkZiy+ymvccM8dQ7T6zLVpX1NHaQN5io640X/7tTDXjGW2lUtFb2WMjkLtbfVgl1rtJndgI/Kni73VmqdLCQDTVVAkxxWbesK19JCxZpVurvW3nftSdxcIXGkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ8N4PRN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ8N4PRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FDFC2BCB0;
	Fri, 15 May 2026 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778841757;
	bh=TrEbHx5wvfb8nmTnI06Lbjz3NtUdfmgRyx1f7GjOlsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJ8N4PRNQMldILOJhBJ03CBWqqod7LOsNvUxEKVrFwQKnz9MJwma0M6PbIqUdLLuM
	 U/nHFCQki2tj8YTGkoObmBHd0D3tBJ9pYHExPTyk1ZAG26lGK9NyXBSZo98AT91VwJ
	 uzkD9sb0RjUgL7MHSboUgiW9C7lbrYt0gRMWvt0LXb+vozy+86YlRGAAy1z03MHi4q
	 zhWRaGX5H+v5zX+rfQOl45cGbGFcR5ZQD2KvjMSZlzX+S+qZDaijceKjoyZKlK94B5
	 5ZFv0I9eVdnkaHqZ7HSdvFzIHTOuWY/b3X8PHaj13USTU/Ve671sr1CSs6eXhEoVRl
	 hP6TprXE+RwmQ==
Date: Fri, 15 May 2026 12:42:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx678: Add driver for Sony IMX678
Message-ID: <20260515-auspicious-groovy-otter-46d8d6@quoll>
References: <20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com>
 <20260513-imx678-v1-2-30fc593ed8fa@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-imx678-v1-2-30fc593ed8fa@ideasonboard.com>

On Wed, May 13, 2026 at 09:03:17PM +0530, Jai Luthra wrote:
> +
> +static void imx678_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx678 *imx678 = to_imx678(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	imx678_free_controls(imx678);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		imx678_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +MODULE_DEVICE_TABLE(of, imx678_dt_ids);

This is always immediately after the table.

Best regards,
Krzysztof

