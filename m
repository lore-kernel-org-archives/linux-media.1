Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EADD23BCED
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781998664; cv=none; b=XCMKYzrtOHfrtlrDA5PoxBURQCJKgqONw567u5RAbsYugupXD33oI2Y/+Jg/sQf5dlTZgLIR53vlvsrMqaNWAlI8Aza4Pj3k14VjyGSpX9UtsIzpeVcvYpDqJPjaldb9H4umuohc96KdHtCJwCUb3gFZCGJNC7+LXRWgoznxO0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781998664; c=relaxed/simple;
	bh=kKV8fkzZ4NKoeJeZz9dLwYSPWbjxm2yHtlqJf2/k/WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHYKiqqk2NvL0VRrFzGUMUZz1hJW8nj/YGn6Batkxb+u7EmFw8LJ4TDRIJpwKrHpW1NeLEwPTZ6MmqNRKKP5/MxYhFVV3TCZHVphX5Uz8pXStXSNMOz8XQGzFIS3ZUv7FVB8Co4p6WxGIhQJgMxrgqjLIi4oBk0kyYIIYTNexCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=z/0cjkN+; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="z/0cjkN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1781998657;
	bh=O9E+7l5IFXu4RTVOsMeyI74AIwZ45KAzj5owUSypf/o=;
	h=From:Subject:Date:Message-ID;
	b=z/0cjkN+Nge/vm5o+11XvD8MGa0FdzgkmTQw8cZmV/yzndRStOwFGjB9al0AaOTvI
	 2ufmY0AbzneVaGpQl3qINTeFm/ipMpPdWA43qL6bNllGynZid8PEFk+eMFmzgURABb
	 A14pX6I6Ox/WekPfK8CMeUQm5MOb5WQCVzOH+cYk=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.32) with ESMTP
	id 6A3723AA00006036; Sat, 21 Jun 2026 07:35:08 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4452744456675
X-SMAIL-UIID: 8E960A235EA2424591A5F97B15C162BD-20260621-073508-1
From: Hillf Danton <hdanton@sina.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+051024d603432b4ab395@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: cec: cancel delayed work before freeing an interrupted transmit
Date: Sun, 21 Jun 2026 07:34:54 +0800
Message-ID: <20260620233457.1923-1-hdanton@sina.com>
In-Reply-To: <20260620191515.50238-2-birenpandya@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 21 Jun 2026 00:45:13 +0530 Biren Pandya wrote:
> If wait_for_completion_killable() is interrupted in cec_transmit_msg_fh(),
> the previous cancel_delayed_work_sync() could race with the CEC kthread,
> which might re-arm the timeout *after* the cancel completes. This leads
> to freeing active delayed_work and an ODEBUG warning.
> 
Given no specifying how it is armed again after cancel, re-arm in general is
handled by disabling the work item before cancel.

> Fix this by cancelling the delayed work only after removing the data from
> the transmit and wait queues, ensuring the kthread cannot re-arm it. Drop
> adap->lock around the synchronous cancel to avoid deadlocking with
> cec_wait_timeout().
> 
> Fixes: 490d84f6d73c ("media: cec: forgot to cancel delayed work")
> Reported-by: syzbot+051024d603432b4ab395@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=051024d603432b4ab395
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/cec/core/cec-adap.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index 8f7244ac1d43..50bd8bbeb5a5 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -965,7 +965,6 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
>  	 */
>  	mutex_unlock(&adap->lock);
>  	err = wait_for_completion_killable(&data->c);
> -	cancel_delayed_work_sync(&data->work);
>  	mutex_lock(&adap->lock);
>  
>  	if (err)
> @@ -985,6 +984,13 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
>  		list_del(&data->list);
>  	if (WARN_ON(!list_empty(&data->xfer_list)))
>  		list_del(&data->xfer_list);
> +
> +	if (!cancel_delayed_work(&data->work)) {
> +		mutex_unlock(&adap->lock);
> +		cancel_delayed_work_sync(&data->work);
> +		mutex_lock(&adap->lock);
> +	}
> +
>  	kfree(data);
>  	return 0;
>  }
> -- 
> 2.50.1
