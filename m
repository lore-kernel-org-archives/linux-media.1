Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72933A9CB
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115326; cv=none; b=LMJLfyYHwXu9ze6WizicJ3Vz1bHnXWmlsRE/GlqC9TH7Pad4y+1ZP0WUM/xRQoCY9pMe/lQAnRxGkFUBMA+njfAAjP2LgFO59qtMAFhieIwIUtgOOVERFp7eXxB15T7lKnZneNkBI+1gFB3U5RL1DaOyQECeu4a9Fs+NSRz2pRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115326; c=relaxed/simple;
	bh=HCg/0dPatS+KL4HCfXc7YnbilVRbOxSQIzF0wIHc+x0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OHOqiIFkuKhqDS0yZ5jBRd+yEQxJ86dFgiYhbJITD7J+UlYU6Gk9fXFWiYanjFzGoy6b7sYGsen3Z/UAPEj9OuGXvcqZaF2cRRJZkBiGI8y3FgJq3BBgFPXUiY1wajDEMnTUlz0vKTJP5QcekIyQq617SStI4g5S97PdZ1b0F9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMElLaTx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMElLaTx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B9EC2BCB7;
	Mon, 18 May 2026 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115326;
	bh=HCg/0dPatS+KL4HCfXc7YnbilVRbOxSQIzF0wIHc+x0=;
	h=From:To:Subject:Date:From;
	b=gMElLaTxK5rEbeZMHyf/KKNiMiYt1y6F6NZIQ94B4Iw4+UrtNLH3NKXSEyUiN8cFr
	 hOUNCqCER8GEc/QAd5AqsHpDU+oH3HQy+EL9RMLbktwFyr0R6YwxTZUtJwbGIWqNwB
	 25hhuIdB6Wv2OxnidlKI7nzVX1excPSRb62N5m67xmXwtwvxex+RBNeL3J5EgjMLlU
	 Pwl8xhITqoTPqZ5qnLlPRtestIAU6TqUvF8reYEgc6dENYH54L9LMK7zD5s4dLWicS
	 8sv3D+yqo1fZyG1u2KKDF17irIjmRPo/XYpDok6kWYw7DKfUbDabz78kSF7MR14HH5
	 fK37B2Xq2ssRg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 0/4] media: cec: add CEC LIP support
Date: Mon, 18 May 2026 16:40:31 +0200
Message-ID: <cover.1779115235.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the new CEC Latency Indication Protocol messages.

The last patch makes it more consistent how CEC 2.0-only
messages are indicated in the header.

Changes since v1:

- added missing media: prefix in subject
- fixed a coding style issue (space after '*')

The remaining coding style issues are consistent with the existing
style of the header. Mainly to keep it readable.

Regards,

	Hans

Hans Verkuil (4):
  media: include/uapi/linux/cec*.h: add CEC LIP support
  Documentation: media: add CEC opcodes
  media: cec: core: add LIP support
  media: include/uapi/linux/cec*: clarify which msgs are CEC 2.0

 .../media/cec/cec.h.rst.exceptions            |  23 +++
 drivers/media/cec/core/cec-adap.c             |   9 +
 include/uapi/linux/cec-funcs.h                | 182 ++++++++++++++++++
 include/uapi/linux/cec.h                      |  31 ++-
 4 files changed, 241 insertions(+), 4 deletions(-)

-- 
2.53.0

