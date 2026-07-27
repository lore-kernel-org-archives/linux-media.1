Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3824A076
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153913; cv=none; b=a3YyPoVKmnHZf2GDzmXayz0QRqtKlGp3GOKnWOFk9kMvZVifb4Wp+aIEzRHgx/NeyeG5zRBoJOgx7ivnQXKCUdahZ26RbcO3+XUhVy9cmlh6838VscDddvHlIwdZ6ec6eBDQMCWoJ49lAadrIvPAKVZfyq+yk6hNvNp2BUOn/dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153913; c=relaxed/simple;
	bh=LGf6BWAJuyb1uq39m1jdlDiJY4z1bfJEj9JRiq3RK+A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AlKHpkTnmy4lpDiYWFiOI97fuVePk5mIo0F+FbIhV/CgS2ugl0Ucxw7n0kG+iTsZ8qrgenpgRlKk5ZxZMIU/9FAaHxFOfPhGzjz/ijSR5JHndCoFAQSptDLZHP4EtVjowVDIiGc/4W2V+lWF8pBB8CjR4Mx3Myl/zH7MRSOPknA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCFkaqel; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCFkaqel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DBF1F000E9;
	Mon, 27 Jul 2026 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785153911;
	bh=47lP3rtxXF+Tjj7q/ptJXy/LQdRJMBv/ETFu53vjpBw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=BCFkaqeljAbZWTGxOBPo1erLI0QgpBdArN/2U3UmRBkacgTc/Ilw8cYlapo5BVXqH
	 z/4LrZf6OxtSOVgXwPjNrlJe1Z1SOxxJFCtU/sgPEKHiSS2k+bqbAHyWrTOnc8/2IU
	 e9x8HFFWB+TC22o+J8oypc6gA/+jbnwCdKXtdlCmD2y5ExE+QDFbmhjszxI2MmeZAw
	 VGsQII043DIUhX41Lxtdfq7nxGiCDAqsWlbFjInj3tlVj+eHyUcDJPa6IRbot+E87Z
	 yRzDcWdhBaXSyiqa6WOB5djDlgwSMql0UDLB6xB/Ae+bHPWpFiIR8/zTu0ZeaNGw0h
	 USw1njywC5zZA==
Message-ID: <911775ef-0220-4b12-a765-f18a90a6d2f7@kernel.org>
Date: Mon, 27 Jul 2026 14:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 11/19] media: nxp: imx7-media-csi: use
 _vb2_fop_release/vb2_video_unregister_device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
 <b782f0db9e0521f97f001d71e3acdc0bc610b066.1784276382.git.hverkuil+cisco@kernel.org>
 <20260717124110.GS1778116@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260717124110.GS1778116@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2026 14:41, Laurent Pinchart wrote:
> On Fri, Jul 17, 2026 at 10:19:34AM +0200, Hans Verkuil wrote:
>> Use _vb2_fop_release instead of manually calling vb2_queue_release
>> and v4l2_fh_release.
>>
>> Use vb2_video_unregister_device instead of video_unregister_device
>> to ensure vb2_queue_release is called inside vb2_video_unregister_device
>> if needed.
> 
> Please expand on the "if needed" to explain why this is needed.

Replaced this with:

"Use vb2_video_unregister_device instead of video_unregister_device
to ensure vb2_queue_release is called inside vb2_video_unregister_device
when streaming. That way streaming is guaranteed to be stopped when
the device is unregistered."

> 
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Frank Li <Frank.Li@nxp.com>
>> ---
>>  drivers/media/platform/nxp/imx7-media-csi.c | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
>> index 7ddc7ba06e3d..eb2b54944ed1 100644
>> --- a/drivers/media/platform/nxp/imx7-media-csi.c
>> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
>> @@ -1545,14 +1545,10 @@ static int imx7_csi_video_release(struct file *file)
>>  
>>  	mutex_lock(&csi->vdev_mutex);
>>  
>> -	if (file->private_data == vq->owner) {
>> -		vb2_queue_release(vq);
>> -		vq->owner = NULL;
>> -	}
>> +	_vb2_fop_release(file, NULL);
>>  
>>  	v4l2_pipeline_pm_put(&csi->vdev->entity);
>>  
>> -	v4l2_fh_release(file);
> 
> You're effectively inverting the order of v4l2_pipeline_pm_put() and
> v4l2_fh_release(). Please explain in the commit message why this is
> safe.
> 
> Commit messages need first and foremost to explain *why* a change is
> needed. The *what* and *how* are secondary.

Updated commit log. v4l2_pipeline_pm_put doesn't access v4l2_fh at all, so
it is fine to do it in this order.

> 
>>  	mutex_unlock(&csi->vdev_mutex);
>>  	return 0;
>>  }
>> @@ -1627,7 +1623,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
>>  				    MEDIA_LNK_FL_ENABLED);
>>  	if (ret) {
>>  		dev_err(csi->dev, "failed to create link to device node\n");
>> -		video_unregister_device(vdev);
>> +		vb2_video_unregister_device(vdev);
>>  		return ret;
>>  	}
>>  
>> @@ -1637,7 +1633,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
>>  static void imx7_csi_video_unregister(struct imx7_csi *csi)
>>  {
>>  	media_entity_cleanup(&csi->vdev->entity);
>> -	video_unregister_device(csi->vdev);
>> +	vb2_video_unregister_device(csi->vdev);

Note: just like your comment in patch 06/19, the media_entity_cleanup should come
after the device is unregistered. I've swapped this in both places.

If media_entity_cleanup is ever changed to actually free something instead of being
an empty function, then I suspect several drivers will stop working since that has
never been tested. :-(

Regards,

	Hans


>>  }
>>  
>>  static int imx7_csi_video_init(struct imx7_csi *csi)
> 

