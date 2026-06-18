Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CDD3BF67A
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780602; cv=none; b=MkUs8k9Howe2Uf0Vr7rWej6nt4O3HJ/uwF0WRkttrKMOVRekVnXbz5eDPWQD8iXwFDpEJlIm0jHN5f+MXCMhHC+k75mc1Pf3p3IMTkhkg1Xv9eEBmJpokATptnKGSBakv9AakO6v0JYvUPBIz7y0gAhep6fInN6rwKPm41952BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780602; c=relaxed/simple;
	bh=sBV3itCSvP+Vx1UUwiYpm/ln2rkG+Y3QNJDu648+NkQ=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=ilz1Fr+GXEpJM0vhCDOzo6sjp9CcjPxr//dm+oEUtdjBXqTqMWfS+AgeeAhFllIi/bUofHYtcKVgc32H4FXFBFOw7aF5RRUw3OBB+pcS4Z0eYbOGviv22jFa1ZxIZMK253BZgX4qqQLxZTdNZbB0BLXhNF+wLSEZobxnZFPzm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQBYqa+B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQBYqa+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688301F000E9
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781780601;
	bh=Eyyka6bJd+b4bhpzFwbyzUv+D4ypD+J7uuelWsn89/I=;
	h=Date:From:To:Subject;
	b=RQBYqa+B2kpSI+5IgTva9Ks+8X+uhSb5QIrIk+ykohmaHPdCjP4CTAo5mQQ+5kCgu
	 CpsF83u7boY0V7ImXzCHroxnVmppQ0NAoN6q7RbzOtxTHJsQjUaNvBRQtSTUEa9GjA
	 ijRJ8+BL2+7Oa08Pmk6sxvEPK6S2Otn7nsD8XP6wOrXk9DOvXTa7jsh1yq+yoGZ8Wl
	 2ciKXz52FTP1PMBZj0i4M83Mau5WSVbxFRK9MbFDrkz2Y7vVFU5zPqt49rdad/pTn2
	 D63LJiIUx6YwkQzIkJ8OKJ/+8AGfDDZF/SvMHA1kr+24U0TqQ97jqIHqT7h+c4HEE4
	 0U498wfMz+a7Q==
Message-ID: <362ab4a1-6591-4715-ad1e-956a65ec322c@kernel.org>
Date: Thu, 18 Jun 2026 13:03:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] media: cec: extron-da-hd-4k-plus: add sanity check
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add check to prevent overflowing msg.msg[] in case the incoming data
is malformed.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 3381d86096a1..3c6ce6f3d93e 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -657,7 +657,8 @@ static void extron_process_received(struct extron_port *port, const char *data)
 	if (!port || port->disconnected)
 		return;

-	if (len < 5 || (len - 2) % 3 || data[len - 2] != '*')
+	if (len < 5 || ((len - 2) / 3 > sizeof(msg.msg)) ||
+	    (len - 2) % 3 || data[len - 2] != '*')
 		goto malformed;

 	while (*data != '*') {
